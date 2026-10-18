import copy
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from ide_regression.manifest import digest
from ide_regression.replay import hydrate, check_report


class ReplayTests(unittest.TestCase):
    def test_compact_catalog_requires_exact_case_and_snapshot_hashes(self):
        case = {'id': 'one', 'execution_id': 'run', 'command_line': 1, 'expected_output': ['old']}
        saved = copy.deepcopy(case)
        saved['expected_output_hash'] = digest(saved.pop('expected_output'))
        self.assertEqual(hydrate([saved], [case]), [case])
        changed = {**case, 'expected_output': ['changed']}
        with self.assertRaisesRegex(ValueError, 'snapshot'):
            hydrate([saved], [changed])
        with self.assertRaisesRegex(ValueError, 'case'):
            hydrate([saved], [])

    def test_missing_or_unrecognized_reports_never_pass(self):
        with self.assertRaises((OSError, ValueError)):
            check_report(Path('/missing/p0/report.json'))
        with patch('ide_regression.replay.read_json', return_value={'gate': {'verdict': 'other'}}):
            with self.assertRaises(ValueError):
                check_report('report.json')
        for verdict, code in [('clean', 0), ('needs_review', 2), ('failed', 1)]:
            with patch('ide_regression.replay.read_json', return_value={'schema_version': 1, 'gate': {'verdict': verdict}}):
                self.assertEqual(check_report('report.json'), code)
