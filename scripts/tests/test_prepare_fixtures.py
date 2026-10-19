"""Regression coverage for configuration-only fixture preparation."""

import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


SCRIPT = Path(__file__).resolve().parents[1] / "prepare-fixtures.py"


@unittest.skipUnless(shutil.which("moon"), "MoonBit CLI is required")
class PrepareFixturesTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="prepare-fixtures-test-")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / "fixtures").mkdir()
        (self.root / "fixtures/repos.yaml").write_text(
            "repos:\n  - slug: sample\n    path: fixtures/repos/sample\n",
            encoding="utf-8",
        )
        self.fixture = self.root / "fixtures/repos/sample"
        self.fixture.mkdir(parents=True)

    def legacy_module(self, directory):
        directory.mkdir(parents=True, exist_ok=True)
        (directory / "moon.mod.json").write_bytes(
            b'{"name":"example/sample","version":"0.1.0","source":"src"}\r\n'
        )
        (directory / "src").mkdir(exist_ok=True)
        (directory / "src/moon.pkg.json").write_bytes(b'{"is-main":true}\n')
        # Invalid source deliberately proves preparation never asks fmt to parse
        # it. The noncanonical CRLF and UTF-8 bytes must survive exactly.
        (directory / "src/main.mbt").write_bytes(b"not valid MoonBit\r\n// \xe6\xb5\x8b\xe8\xaf\x95\r\n")
        (directory / "README.mbt.md").write_bytes(b"# sample\r\n```mbt\r\ninvalid!\r\n```\r\n")

    def prepare(self, *args, cwd=None):
        return subprocess.run(
            [sys.executable, str(SCRIPT), "--root", str(self.root), *args],
            cwd=cwd or self.root,
            capture_output=True,
        )

    def test_migration_preserves_all_source_bytes_and_is_idempotent(self):
        self.legacy_module(self.fixture)
        sources = {
            p: p.read_bytes()
            for p in self.fixture.rglob("*")
            if p.is_file() and (p.name.endswith(".mbt") or p.name.endswith(".mbt.md"))
        }
        result = self.prepare()
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertFalse((self.fixture / "moon.mod.json").exists())
        self.assertFalse((self.fixture / "src/moon.pkg.json").exists())
        self.assertIn('name = "example/sample"', (self.fixture / "moon.mod").read_text())
        self.assertIn('"is-main": true', (self.fixture / "src/moon.pkg").read_text())
        self.assertEqual({p: p.read_bytes() for p in sources}, sources)
        first = {p: p.read_bytes() for p in self.fixture.rglob("*") if p.is_file()}
        result = self.prepare()
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertEqual({p: p.read_bytes() for p in first}, first)

    def test_failure_leaves_every_original_manifest_and_source_unchanged(self):
        self.legacy_module(self.fixture)
        broken = self.fixture / "zzbroken"
        broken.mkdir(parents=True)
        (broken / "moon.mod.json").write_bytes(b"invalid JSON\r\n")
        before = {p: p.read_bytes() for p in self.root.rglob("*") if p.is_file()}
        result = self.prepare()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn(b"moon.mod.json", result.stderr)
        self.assertEqual({p: p.read_bytes() for p in self.root.rglob("*") if p.is_file()}, before)

    def test_only_legacy_manifests_are_replaced_in_modern_module(self):
        (self.fixture / "moon.mod").write_bytes(b'name="example/sample"\n\n')
        (self.fixture / "moon.pkg").write_bytes(b'warnings="-unused_value"\n\n')
        package = self.fixture / "app"
        package.mkdir()
        (package / "moon.pkg.json").write_bytes(b'{"is-main":true}')
        result = self.prepare()
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertTrue((package / "moon.pkg").exists())
        self.assertFalse((package / "moon.pkg.json").exists())
        self.assertEqual((self.fixture / "moon.mod").read_bytes(), b'name="example/sample"\n\n')
        self.assertEqual((self.fixture / "moon.pkg").read_bytes(), b'warnings="-unused_value"\n\n')

    def test_local_cached_dependencies_migrate_without_touching_build_copies(self):
        (self.fixture / "moon.mod").write_text('name = "example/sample"', encoding="utf-8")
        dependency = self.fixture / ".mooncakes/vendor/legacy"
        self.legacy_module(dependency)
        build_copy = self.fixture / "_build/cache"
        self.legacy_module(build_copy)
        original = (build_copy / "moon.mod.json").read_bytes()
        result = self.prepare()
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertTrue((dependency / "moon.mod").exists())
        self.assertFalse((dependency / "moon.mod.json").exists())
        self.assertEqual((build_copy / "moon.mod.json").read_bytes(), original)
        self.assertFalse((build_copy / "moon.mod").exists())

    def test_no_arguments_use_repository_beside_script_from_any_directory(self):
        self.legacy_module(self.fixture)
        scripts = self.root / "scripts"
        scripts.mkdir()
        if SCRIPT.exists():
            shutil.copy2(SCRIPT, scripts / SCRIPT.name)
        result = subprocess.run(
            [sys.executable, str(scripts / SCRIPT.name)],
            cwd=self.root.parent,
            capture_output=True,
        )
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertTrue((self.fixture / "moon.mod").exists())

    def test_linked_dependency_cache_is_not_migrated(self):
        (self.fixture / "moon.mod").write_text('name = "example/sample"', encoding="utf-8")
        external = self.root / "shared-registry-cache"
        self.legacy_module(external)
        link = self.fixture / ".mooncakes"
        try:
            link.symlink_to(external, target_is_directory=True)
        except OSError:
            if os.name != "nt":
                raise
            # Junctions do not require the Windows symlink privilege and are
            # another way a .mooncakes directory can point to a shared cache.
            subprocess.run(
                ["cmd", "/d", "/c", "mklink", "/J", str(link), str(external)],
                check=True, capture_output=True,
            )
        original = (external / "moon.mod.json").read_bytes()
        result = self.prepare()
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertEqual((external / "moon.mod.json").read_bytes(), original)
        self.assertFalse((external / "moon.mod").exists())

    def test_conflicting_modern_manifest_keeps_both_original_files(self):
        self.legacy_module(self.fixture)
        modern = self.fixture / "moon.mod"
        modern.write_bytes(b'name = "example/conflict"\n')
        before = {p: p.read_bytes() for p in self.fixture.rglob("*") if p.is_file()}
        result = self.prepare()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn(b"both legacy and modern", result.stderr)
        self.assertEqual({p: p.read_bytes() for p in self.fixture.rglob("*") if p.is_file()}, before)

    def test_owned_core_project_is_prepared_without_a_yaml_entry(self):
        (self.fixture / "moon.mod").write_text('name = "example/sample"', encoding="utf-8")
        project = self.root / "core_test/test_project"
        self.legacy_module(project)
        result = self.prepare()
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        self.assertTrue((project / "moon.mod").exists())
        self.assertTrue((project / "src/moon.pkg").exists())


if __name__ == "__main__":
    unittest.main()
