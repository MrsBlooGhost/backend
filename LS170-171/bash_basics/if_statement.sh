#!/usr/bin/bash

# Single conditions

# Output a string if it is longer than 0.
string='a'

if [[ -n $string ]]
then
  echo $string
fi

# Compare two integers and output a string if they are equal.
integer_1=1
integer_2=1

if [[ $integer_1 -eq $integer_2 ]]
then
  echo $integer_1 and $integer_2 are the same!
fi

# Output 'File exists' if the file `if_statement.sh` exists.
if [[ -e ./if_statement.sh ]]
then
  echo 'File exists'
fi

# Multiple conditions

# nested if statement
integer=8

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10

  if [[ $integer -lt 5 ]]
  then
    echo $integer is also less than 5
  fi
fi

# two conditional branches with if and else
integer=6

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi

# three conditional branches with if, elif, and else
integer=100

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
elif [[ $integer -gt 20 ]]
then
  echo $integer is greater than 20
else
  echo $integer is between 10 and 20
fi

# matching two conditions using && (and)
integer=17

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi

# matching one of two conditions using || (or)
integer=1

if [[ $integer -lt 5 ]] || [[ $integer -gt 10 ]]
then
  echo $integer is less than 5 or greater than 10.
fi

# negating conditions using ! (not)
integer=6

if [[ ! ($integer -lt 5 || $integer -gt 10) ]]
then
  echo $integer is between 5 and 10.
fi