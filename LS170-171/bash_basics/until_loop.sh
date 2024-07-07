#!/usr/bin/bash

counter=5
max=10

until [[ $counter -gt $max ]]
do
  echo $counter
  ((counter++))
done