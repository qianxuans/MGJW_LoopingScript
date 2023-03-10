#!/bin/bash

conda activate mash

for i in *fna
do
mash screen -w -p 8 RefSeqSketches.msh $i > $i.mash.tab
sort -gr $i.mash.tab > $i.mash_sorted.tab
done
