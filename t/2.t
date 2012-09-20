# this is just the second test file - here to make sure tester picks it up

COMMAND echo this is 2.t
STDOUT ^this is 2.t$
EXIT 0

# this should test for a bad command
COMMAND foof
STDERR Can't exec "foof"
EXIT 255

# a final test for 2.t
COMMAND echo 2.t DONE
STDOUT ^2.t DONE$
EXIT 0
