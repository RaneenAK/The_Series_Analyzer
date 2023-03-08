#! /bin/bash

New_Series(){
echo "please enter a new series: " 
read -a my_array
echo "${my_array[@]}"
return "${my_array[@]}"
}

In_the_same_order(){
for element in "${args[@]}"
do
    echo -n "$element " 
done

}
In_the_same_order $args

From_low_to_high(){
    i=0
    while [[ i -lt ${#args[*]} ]]
    do
        j=0
        let sorting=${#args[*]}-$i-1
        while [[ j -lt $sorting ]]
        do
            if [ ${args[j]} -gt ${args[$((j+1))]} ]
            then
            temp=${args[j]}
            args[$j]=${args[$((j+1))]}
            args[$((j+1))]=$temp
            fi
            let j=$j+1
        done
        let i=$i+1
    done
    echo ${args[*]}
}   
From_low_to_high $args

function max_value() {
    max=${args[0]}
    for num in "${args[@]}"; do
        if (( num > max )); then
            max=$num
        fi
    done
    echo $max
}
max_value $args


function min_value() {
    min=${args[0]}
    for num in "${args[@]}"; do
        if (( num < min )); then
            min=$num
        fi
    done
    echo $min
}
min_value $args

function Sum(){
sum=0
for i in ${args[@]}; do
  let sum+=$i
done
echo "$sum"
#return $sum
} 
Sum

function Average(){
  num_values=${#args[@]}
  local total=$sum
  let avr=$total/$num_values
    echo "$avr"
}

function Number_of_elements(){
    echo ${#args[@]}
}
Number_of_elements $args

#____________________________________________________________________


args=("$@")
numbers_to_check=${#args[@]}
if [[ $numbers_to_check -le 3 && $args =~ [a-z] && $args =~ [A-Z] 
|| $args =~ [a-z] || $args =~ [A-Z] ]]
then
    echo $#
    echo "error"

else
  for i in "${args[@]}"
    do
        echo -n "$i"" "
    done
    echo
fi


echo "Please select your desired option"
options=("New Series" "In the same order" "From low to high" "Max Value" "Min Value" "Average" "Number of elements" "Sum" "Exit")
COLUMNS=1
select i in "${options[@]}" ; do
case $i in
"New Series") New_Series ;;
"In the same order") In_the_same_order ;;
"From low to high") From_low_to_high ;; 
"Max Value") max_value ;;
"Min Value") min_value ;;
"Average") Average ;;
"Number of elements") Number_of_elements ;; 
"Sum") Sum ;;
"Exit") exit ;;
*) echo "Invalid option please try again" ;;
esac
done 

