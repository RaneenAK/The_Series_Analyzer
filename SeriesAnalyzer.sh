#! /bin/bash

# a. Input a Series. (Replace the current series)
# b. Display the series in the order it was entered.
# c. Display the series in sorted order (from low to
# high).
# d. Display the Max value of the series.
# e. Display the Min value of the series.
# f. Display the Average of the series.
# g. Display the Number of elements in the series.
# h. Display the Sum of the series.
# i. Exit.


args=("$@")
numbers_to_check=${#args}
if [[ $numbers_to_check -ge 3 || $args =~ [a-z] && $args =~ [A-Z] ]]
then
    echo "you have entered invalid input .. please try again"
fi


echo "Please select your desired option"
options=("New Series" "In the same order" "From low to high" "Max Value" "Min Value" "Average" "Number of elements" "Sum" "Exit")
select i in "${options[@]}" ; do
case $i in
"New Series") ;;
"In the same order") ;;
"From low to high") ;; 
"Max Value") max_value ;;
"Min Value") min_value ;;
"Average") Average ;;
"Number of elements") Number_of_elements ;; 
"Sum") Sum ;;
"Exit") exit ;;
*) echo "Invalid option please try again" ;;
esac
done 

function max_value() {
# Initialize max to the first argument
local max=$1

# Loop through the remaining arguments
for num in "${@:2}" ; do
    # If the current number is greater than max, update max
    if [ $num -gt $max ]; then
        max=$num
    fi
done

# Output the max value
echo $max
}

function min_value() {
# Initialize max to the first argument
local min=$1

# Loop through the remaining arguments
for num in "${@:2}" ; do
    # If the current number is less than min, update min
    if [ $num -lt $min ]; then
        min=$num
    fi
done

# Output the max value
echo $min
}


Average(){
  let avr=Sum/$#
    echo "$avr"
}
Number_of_elements(){
    echo $#
}

Sum(){
sum=0
for i in ${array[@]}; do
  let sum+=$i
done
echo "$sum"
return $sum
}
