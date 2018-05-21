

# getopts

# The only reason you would ever use getopts is to allow single-letter option combining (-xvf handled as -x -v -f). It has no other purpose. The trade-off for this is that you cannot use long arguments of any kind (GNU-style "--foo" or Tcl-style "-foo").

# Never use getopt(1). Traditional versions of getopt cannot handle empty argument strings, or arguments with embedded whitespace. There is a version of getopt(1) in util-linux, but you should not use it. Why not? Because you would need to write special safety-checking code to ensure that you've actually got this nonstandard getopt, and then you would still need to write a fallback option processor for when you don't have it. So you're doing twice as much work and getting no significant benefits for it.


# ****************************************************************************
# Example #1
# ****************************************************************************

verbose='false'
aflag=''
bflag=''
files=''

while getopts 'abf:v' flag; do
  case "${flag}" in
    a) aflag='true' ;;
    b) bflag='true' ;;
    f) files="${OPTARG}" ;;
    v) verbose='true' ;;
    # *) error "Unexpected option ${flag}" ;;
    ?) printf '\nUsage: %s: [-a] aflag [-b] bflag\n' $0; exit 2 ;;
  esac
done


# If a character is followed by a colon (e.g. f:), that option is expected to have an argument.

# Example usage: ./script -v -a -b -f filename
#
# Using getopts has several advantages over the accepted answer:
# - the while condition is a lot more readable and shows what the accepted options are
# - cleaner code; no counting the number of parameters and shifting
# - you can join options (e.g. -a -b -c → -abc)
# - However, a big disadvantage is that it doesn't support long options, only single-character options.


# ****************************************************************************
# Example #2 (From Google's Shell Style Guide)[https://google.github.io/styleguide/shell.xml]
# ****************************************************************************

function f () {
TEMP=`getopt --long -o "u:h:" "$@"`
eval set -- "$TEMP"
while true ; do
    case "$1" in
        -u )
            user=$2
            shift 2
        ;;
        -h )
            host=$2
            shift 2
        ;;
        *)
            break
        ;;
    esac 
done;

echo "user = $user, host = $host"
}

f -u myself -h some_host

# ****************************************************************************
# Example #3
# ****************************************************************************


# Another alternative would be to use something like the below example which would allow you to use long --image or short -i tags and also allow compiled -i="example.jpg" or separate -i example.jpg methods of passing in arguments.

# declaring a couple of associative arrays
declare -A arguments=();  
declare -A variables=();

# declaring an index integer
declare -i index=1;

# any variables you want to use here
# on the left left side is argument label or key (entered at the command line along with it's value) 
# on the right side is the variable name the value of these arguments should be mapped to.
# (the examples above show how these are being passed into this script)
variables["-gu"]="git_user";  
variables["--git-user"]="git_user";  
variables["-gb"]="git_branch";  
variables["--git-branch"]="git_branch";  
variables["-dbr"]="db_fqdn";  
variables["--db-redirect"]="db_fqdn";  
variables["-e"]="environment";  
variables["--environment"]="environment";

# $@ here represents all arguments passed in
for i in "$@"  
do  
  arguments[$index]=$i;
  prev_index="$(expr $index - 1)";

  # this if block does something akin to "where $i contains ="
  # "%=*" here strips out everything from the = to the end of the argument leaving only the label
  if [[ $i == *"="* ]]
    then argument_label=${i%=*} 
    else argument_label=${arguments[$prev_index]}
  fi

  # this if block only evaluates to true if the argument label exists in the variables array
  if [[ -n ${variables[$argument_label]} ]]
    then
        # dynamically creating variables names using declare
        # "#$argument_label=" here strips out the label leaving only the value
        if [[ $i == *"="* ]]
            then declare ${variables[$argument_label]}=${i#$argument_label=} 
            else declare ${variables[$argument_label]}=${arguments[$index]}
        fi
  fi

  index=index+1;
done;

# then you could simply use the variables like so:
echo "$git_user";


# ****************************************************************************
# Example #4
# ****************************************************************************


# An option with argument
# Let's extend our example from above. Just a little bit:
# 
# -a now takes an argument
# on an error, the parsing exits with exit 1
# #!/bin/bash
 
while getopts ":a:" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Let's do the very same tests we did in the last example:
# 
# Calling it without any arguments
# 
$ ./go_test.sh
$ 
# As above, nothing happened. It wasn't triggered.

# Calling it with non-option arguments
# 
$ ./go_test.sh /etc/passwd
$ 

# The very same case: It wasn't triggered.

# Calling it with option-arguments 

# Invalid option:

$ ./go_test.sh -b
Invalid option: -b
$ 

# As expected, as above, getopts didn't accept this option and acted like programmed.

# Valid option, but without the mandatory argument:

$ ./go_test.sh -a
Option -a requires an argument.
$ 
# The option was okay, but there is an argument missing.

# Let's provide the argument:

$ ./go_test.sh -a /etc/passwd
-a was triggered, Parameter: /etc/passwd
$
