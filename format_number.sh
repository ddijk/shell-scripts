#!/bin/bash
if [[ -z "$1" ]]; then
    echo "Geef getal als arg";
    exit;
fi;

# split input number into digits separated by spaces
digits=$(echo "$1" | sed -E 's/(.)/\1 /g')

# convert to array
digit_array=($digits)
#echo "digit_array is $digit_array en lengte ${digit_array[@]}";
n=${#digit_array[@]};

number_groups=$(( n / 3 ))
#echo "Aantal groepen is $number_groups"

start_index=$(( n -3*number_groups))
#echo "start index is $start_index"
#echo "digits in veelvoud van 3: ${digit_array[@]:start_index}"

first_digits=${digit_array[@]:0:start_index}
echo -n "$first_digits" | sed 's/ //g'
echo -n " "

# first digits before grouping starts
offset=$(( n - 3*number_groups ))

for (( i=0; i<$number_groups; i++ )); do

    echo -n "${digit_array[@]:offset+i*3:3}" | sed 's/ //g'
    echo -n " "
done
echo 
