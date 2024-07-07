#!/usr/bin/bash 

counter=0
max=15

while [[ $counter -le $max ]]
do
  echo current count: $counter
  ((counter++))
done