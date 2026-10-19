import importlib
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
review = importlib.import_module("prepare-review")


class ReviewLogTests(unittest.TestCase):
    def test_utf8_and_bom_marked_utf16_preserve_the_entire_transcript(self):
        text = "first\n测试 / stderr\nResult: 280 total, 117 updated\n"
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            for encoding in ("utf-8", "utf-8-sig", "utf-16"):
                source, destination = root / "source.log", root / "review.log"
                source.write_bytes(text.encode(encoding))
                review.copy_utf8(source, destination)
                self.assertEqual(destination.read_bytes(), text.encode("utf-8"))

    def test_invalid_encoding_is_not_silently_replaced(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "source.log"
            source.write_bytes(b"broken \xff log")
            with self.assertRaises(UnicodeDecodeError):
                review.copy_utf8(source, root / "review.log")


if __name__ == "__main__":
    unittest.main()
