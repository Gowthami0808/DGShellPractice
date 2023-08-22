#!/bin/bash
for i in 1 2 3 4 5
do
   echo "Hi $i"
done
for i in {10..15} #more than two dots won't work
do
   echo "Welcome $i times"
done

#has inbuilt support for setting up a step value using {START..END..INCREMENT} syntax:

for i in {0..10..2}
do
  echo "Welcome stepd $i times"
done