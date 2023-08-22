#!/bin/bash
Red="\e[31m"
green="\e[32m"
normal="\e[0m"

echo -e "$Red this text should be red" #-e to enable colouring
echo -e "$green this text should be green, $normal from here it will follow normal colour"