# this test file looks for TAP v1.3 output

COMMAND ../tester -n 2.t
STDOUT ^TAP version 1.3$
EXIT 0

COMMAND ../tester -n failtests
STDOUT ^TAP version 1\.3\n1\.\.\d\nnot ok \d - .*# Diagnostic.*  ---\n.*\n  \.\.\.$
EXIT 1
