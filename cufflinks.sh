#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --time=10:00:00
#SBATCH --mem=10G
#SBATCH --mail-type=all
#SBATCH --mail-user=lweis@princeton.edu


export PATH=$PATH:/tigress/AUTISM/Programs/cufflinks-2.2.1.Linux_x86_64:/tigress/AUTISM/Programs/samtools-1.2/

ref="/tigress/AUTISM/refGenomes/drosophila/Drosophila_melanogaster.BDGP6.32.dna.toplevel.fa"
DIR="/tigress/AUTISM/Liz/results"
cd ${DIR}


for i in `ls`
do
	outfolder=$( echo ${i} )
	#if [ ! -d ${ResultFolder}/${outfolder}]
	#then
		#mkdir -p ${ResultFolder}/${outfolder}
		mkdir -p ${i}/cufflinksOutput 
	#fi
cufflinks -o ${i}/cufflinksOutput -p6 --library-type fr-firststrand -g /tigress/AUTISM/refGenomes/drosophila/Drosophila_melanogaster.BDGP6.32.109.gtf -b /tigress/AUTISM/refGenomes/drosophila/Drosophila_melanogaster.BDGP6.32.dna.primary_assembly.fa ${i}/Aligned.sortedByCoord.out.bam

done
