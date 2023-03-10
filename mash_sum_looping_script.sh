#!/bin/bash

for i in *mash_sorted.tab
do
echo "$i"
head -n 1 $i
done > Mash_output_summary.tab