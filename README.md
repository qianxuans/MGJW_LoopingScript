# Looping script can save us time
## Why we need looping script?
If we have 1000 genome files:
```
Genome_1.fna 
Genome_2.fna
...
Genome_999.fna
Genome_1000.fna
```
We want to use Mash to identify the species, and save the output file: 
```bash
mash screen -w -p 8 RefSeqSketches.msh genome_1.fna > genome_1_mash.tab
mash screen -w -p 8 RefSeqSketches.msh genome_2.fna > genome_2_mash.tab
...
mash screen -w -p 8 RefSeqSketches.msh genome_999.fna > genome_999_mash.tab
mash screen -w -p 8 RefSeqSketches.msh genome_1000.fna > genome_1000_mash.tab
```
Do we type the command 1000 times?

Maybe wild cards?
```
mash screen -w -p 8 RefSeqSketches.msh genome_*.fna > genome_*mash.tab
```

there will be an error:
```
-bash: *.tab: ambiguous redirect
```

## Loop in shell script
The most typical loop used in a shell script is the ****for**** loop.
The for loop allows you to iterate over a sequence of items, such as a list of files or directories, and perform a certain action on each item in the sequence.

```bash
for item in list
do
    # commands to execute on each item
done
```

## The use of loop script in Mash
In current directory, I want to iterate over all the genome files with the same command: 
```bash
for i in *.fna
do 
mash screen -w -p 8 RefSeqSketches.msh $i > $i.mash.tab
done
```
add the sorting command to our loop: 
```bash
for i in *.fna
do
mash screen -w -p 8 RefSeqSketches.msh $i > $i.mash.tab
sort -gr $i.mash.tab > $i.mash_sorted.tab
done
```

Not confident about your commands?

We can use echo " " to print the command first: 
```bash
for i in *.fna
do 
echo "mash screen -w -p 8 RefSeqSketches.msh $i > $i.mash.tab"
echo "sort -gr $i.mash.tab > $i.mash_sorted.tab"
done
```
