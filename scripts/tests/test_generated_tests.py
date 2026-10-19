import importlib
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
generated = importlib.import_module("check-generated-tests")


class GeneratedTestsTests(unittest.TestCase):
    def test_detects_worktree_index_and_new_files(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            def git(*args):
                subprocess.run(["git", *args], cwd=root, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
            git("init", "-q")
            git("config", "user.email", "test@example.invalid")
            git("config", "user.name", "Test")
            (root / "tests").mkdir()
            tracked = root / "tests/a.md"
            tracked.write_text("old\n")
            git("add", ".")
            git("commit", "-qm", "initial")
            self.assertFalse(generated.has_changes(["tests"], cwd=root))
            tracked.write_text("new\n")
            self.assertTrue(generated.has_changes(["tests"], cwd=root))
            git("add", "tests")
            self.assertTrue(generated.has_changes(["tests"], cwd=root))
            git("reset", "--hard", "HEAD")
            new = root / "tests/new.md"
            new.write_text("new\n")
            self.assertTrue(generated.has_changes(["tests"], cwd=root))
            new.unlink()
            tracked.unlink()
            self.assertTrue(generated.has_changes(["tests"], cwd=root))


if __name__ == "__main__":
    unittest.main()
