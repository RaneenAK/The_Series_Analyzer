#! /bin/bash

args=("$@")
numbers_to_check=${#args}
if [[ $numbers_to_check -lt 3 || $args =~ [a-z] && $args =~ [A-Z] ]]
then
    echo $#
    echo "error"
else
    for i in "${args[@]}"
    do
        echo -n " ""$i"
    done
    echo
fi
