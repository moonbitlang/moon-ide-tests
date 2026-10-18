from pathlib import Path
import os
import subprocess
import sys
import unittest
from unittest.mock import Mock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.process import execute


class ProcessTests(unittest.TestCase):
    def test_timeout_terminates_the_entire_child_tree_before_collecting_pipes(self):
        process = Mock(pid=1234, returncode=-1)
        process.communicate.side_effect = [subprocess.TimeoutExpired(['cmd'], 1), ('partial', 'timeout')]
        with patch('ide_regression.process.subprocess.Popen', return_value=process), \
             patch('ide_regression.process.subprocess.run') as taskkill, \
             patch('ide_regression.process.os.killpg', create=True) as killpg:
            with self.assertRaises(subprocess.TimeoutExpired):
                execute(['cmd'], timeout=1)
        if os.name == 'nt':
            self.assertIn('/T', taskkill.call_args.args[0])
            self.assertIn('1234', taskkill.call_args.args[0])
        else:
            killpg.assert_called_once()
        self.assertEqual(process.communicate.call_count, 2)
