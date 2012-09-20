# this test file looks for TAP v1.2 output

COMMAND ../tester -o 2.t
STDOUT ^1\.\.\d$
EXIT 0

COMMAND ../tester -o failtests
#STDOUT ^1\.\.\d\nnot ok \d - .*# STDOUT: mismatch\n# - Expected: .*\n# - Actual:\n# -- .*$
EXIT 1
