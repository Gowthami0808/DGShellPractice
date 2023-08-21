#!/bin/bash
Persons=(1 2 3 four)
Item=${Persons[0]}
Items=${Persons[@]}
echo "write item1 : $Item"
echo "listing all items : $Item"
