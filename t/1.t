# this is a comment

# This sets some variables for later use
ENV = testing
MYVALUE=we have something in here
ARGS= -g --who=zort
RAND1=@RANDINT(100)
RAND2=@RANDINT(100)
RANDINTS=@RANDINT(33) is probably not @RANDINT(7)
STRING = @RANDWORD(5)
OTHERSTRING=@RANDWORD(3)

# echo a variable as ${VARNAME} and look for static result
COMMAND echo ${ENV}
STDOUT ^testing$
EXIT 0

# echo a variable as $VARNAME and look for static result
COMMAND echo $MYVALUE
STDOUT something
EXIT 0

# look for a nonzero exit code
COMMAND false ${ARGS}
EXIT 1

# test the @RANDINTS function
COMMAND echo ${RANDINTS}
STDOUT ${RANDINTS}

# test the @RANDWORD function
COMMAND echo $STRING
STDOUT ${STRING}

# test a pipe
COMMAND echo $STRING | wc -w
STDOUT 5

# test the @RANDWORD function with anchored regex
COMMAND echo ${OTHERSTRING}
STDOUT ^$OTHERSTRING$

# test a redirection
COMMAND echo $OTHERSTRING > /dev/null
STDOUT ^$
EXIT 0

# test shell arithmetic
COMMAND echo $(( 4 + 7 ))
STDOUT ^11$
EXIT 0

# and some random arithmetic
COMMAND echo $(( $RAND1 + $RAND2 ))
STDOUT ^\d+$
EXIT 0

# a bad sed
COMMAND sed -e f
STDOUT ^$
STDERR (invalid|unknown) command
EXIT 1

# bad test file syntax
COMMAND ../tester badsyntax
STDERR Test file syntax error at
EXIT 2

# test the "test" directory detection
COMMAND ../tester
STDOUT ok 1 - test\/1.t
EXIT 0

# test the "othertest" explicit directory
COMMAND ../tester -t othertest
STDOUT ok 1 - othertest\/1.t
EXIT 0
