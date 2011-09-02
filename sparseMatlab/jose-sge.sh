#$ -cwd
#$ -o josejobs-stdout.txt
#$ -e josejobs-stderr.txt
#$ -M jmc521@student.cs.york.ac.uk
#$ -S /bin/bash
#$ -l mem_total=10G
#$ -N josejob

cd /n/sebase/jps/jose/sparseMatlab

./gridScript.sh $SGE_TASK_ID