#tophat-2.0.5, bowtie2-2.0.0-beta7 and SAMtools (0.1.18) was used.
# Set RAWDATAPATH enivronmental variable to the path of the raw data of the 
# sequencing reads (.sra and .fastq) files.   
# Set MAPPINGPATH enivronmental variable with path to mapped sequence reads.
# Set indexPATH enivronmental variable with path to the bowtie 2 indexes.
# On our machine following environmental variables were set.
# export MAPPINGPATH=/data1/ali/develop/sequencing/package/testInterestComplete/validation/
# export RAWDATAPATH=/data1/ali/projects/data/zrsr2/
# export indexPATH=/data1/ali/software/sequencing/bowtie2/indexes/hg19NoColor/hg19

cd $RAWDATAPATH

# Download sra files
wget -i $SCRIPTSPATH/sraFilesURL.txt

# Convert sra to fastq files
nohup fastq-dump -I --split-files SRR1691633.sra &
nohup fastq-dump -I --split-files SRR1691634.sra &
nohup fastq-dump -I --split-files SRR1691635.sra &
nohup fastq-dump -I --split-files SRR1691636.sra &
nohup fastq-dump -I --split-files SRR1691637.sra &
nohup fastq-dump -I --split-files SRR1691638.sra &
nohup fastq-dump -I --split-files SRR1691639.sra &
nohup fastq-dump -I --split-files SRR1691640.sra &
nohup fastq-dump -I --split-files SRR1691641.sra &
nohup fastq-dump -I --split-files SRR1691642.sra &
nohup fastq-dump -I --split-files SRR1691643.sra &
nohup fastq-dump -I --split-files SRR1691644.sra &
nohup fastq-dump -I --split-files SRR1691645.sra &
nohup fastq-dump -I --split-files SRR1691646.sra &
nohup fastq-dump -I --split-files SRR1691647.sra &
nohup fastq-dump -I --split-files SRR1691648.sra &



cd $MAPPINGPATH

#Mapping the reads
mkdir $MAPPINGPATH/SRR1691633/
tophat2 -o $MAPPINGPATH/SRR1691633/ -p 6 $indexPATH $RAWDATAPATH/SRR1691633_1.fastq $RAWDATAPATH/SRR1691633_2.fastq

mkdir $MAPPINGPATH/SRR1691634/
tophat2 -o $MAPPINGPATH/SRR1691634/ -p 6 $indexPATH $RAWDATAPATH/SRR1691634_1.fastq $RAWDATAPATH/SRR1691634_2.fastq

mkdir $MAPPINGPATH/SRR1691635/
tophat2 -o $MAPPINGPATH/SRR1691635/ -p 6 $indexPATH $RAWDATAPATH/SRR1691635_1.fastq $RAWDATAPATH/SRR1691635_2.fastq

mkdir $MAPPINGPATH/SRR1691636/
tophat2 -o $MAPPINGPATH/SRR1691636/ -p 6 $indexPATH $RAWDATAPATH/SRR1691636_1.fastq $RAWDATAPATH/SRR1691636_2.fastq

mkdir $MAPPINGPATH/SRR1691637/
tophat2 -o $MAPPINGPATH/SRR1691637/ -p 6 $indexPATH $RAWDATAPATH/SRR1691637_1.fastq $RAWDATAPATH/SRR1691637_2.fastq

mkdir $MAPPINGPATH/SRR1691638/
tophat2 -o $MAPPINGPATH/SRR1691638/ -p 6 $indexPATH $RAWDATAPATH/SRR1691638_1.fastq $RAWDATAPATH/SRR1691638_2.fastq

mkdir $MAPPINGPATH/SRR1691639/
tophat2 -o $MAPPINGPATH/SRR1691639/ -p 6 $indexPATH $RAWDATAPATH/SRR1691639_1.fastq $RAWDATAPATH/SRR1691639_2.fastq

mkdir $MAPPINGPATH/SRR1691640/
tophat2 -o $MAPPINGPATH/SRR1691640/ -p 6 $indexPATH $RAWDATAPATH/SRR1691640_1.fastq $RAWDATAPATH/SRR1691640_2.fastq

mkdir $MAPPINGPATH/SRR1691641/
tophat2 -o $MAPPINGPATH/SRR1691641/ -p 6 $indexPATH $RAWDATAPATH/SRR1691641_1.fastq $RAWDATAPATH/SRR1691641_2.fastq

mkdir $MAPPINGPATH/SRR1691642/
tophat2 -o $MAPPINGPATH/SRR1691642/ -p 6 $indexPATH $RAWDATAPATH/SRR1691642_1.fastq $RAWDATAPATH/SRR1691642_2.fastq

mkdir $MAPPINGPATH/SRR1691643/
tophat2 -o $MAPPINGPATH/SRR1691643/ -p 6 $indexPATH $RAWDATAPATH/SRR1691643_1.fastq $RAWDATAPATH/SRR1691643_2.fastq

mkdir $MAPPINGPATH/SRR1691644/
tophat2 -o $MAPPINGPATH/SRR1691644/ -p 6 $indexPATH $RAWDATAPATH/SRR1691644_1.fastq $RAWDATAPATH/SRR1691644_2.fastq

mkdir $MAPPINGPATH/SRR1691645/
tophat2 -o $MAPPINGPATH/SRR1691645/ -p 6 $indexPATH $RAWDATAPATH/SRR1691645_1.fastq $RAWDATAPATH/SRR1691645_2.fastq

mkdir $MAPPINGPATH/SRR1691646/
tophat2 -o $MAPPINGPATH/SRR1691646/ -p 6 $indexPATH $RAWDATAPATH/SRR1691646_1.fastq $RAWDATAPATH/SRR1691646_2.fastq

mkdir $MAPPINGPATH/SRR1691647/
tophat2 -o $MAPPINGPATH/SRR1691647/ -p 6 $indexPATH $RAWDATAPATH/SRR1691647_1.fastq $RAWDATAPATH/SRR1691647_2.fastq

mkdir $MAPPINGPATH/SRR1691648/
tophat2 -o $MAPPINGPATH/SRR1691648/ -p 6 $indexPATH $RAWDATAPATH/SRR1691648_1.fastq $RAWDATAPATH/SRR1691648_2.fastq

#Index the bam files
samtools index $MAPPINGPATH/SRR1691633/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691634/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691635/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691636/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691637/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691638/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691639/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691640/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691641/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691642/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691643/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691644/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691645/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691646/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691647/accepted_hits.bam
samtools index $MAPPINGPATH/SRR1691648/accepted_hits.bam

# Convert bam to sam
samtools view -h -o $MAPPINGPATH/SRR1691633/SRR1691633_ZRSR2Mut.sam $MAPPINGPATH/SRR1691633/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691634/SRR1691634_ZRSR2Mut.sam $MAPPINGPATH/SRR1691634/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691635/SRR1691635_ZRSR2Mut.sam $MAPPINGPATH/SRR1691635/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691636/SRR1691636_ZRSR2Mut.sam $MAPPINGPATH/SRR1691636/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691637/SRR1691637_ZRSR2Mut.sam $MAPPINGPATH/SRR1691637/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691638/SRR1691638_ZRSR2Mut.sam $MAPPINGPATH/SRR1691638/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691639/SRR1691639_ZRSR2Mut.sam $MAPPINGPATH/SRR1691639/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691640/SRR1691640_ZRSR2Mut.sam $MAPPINGPATH/SRR1691640/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691641/SRR1691641_WT.sam $MAPPINGPATH/SRR1691641/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691642/SRR1691642_WT.sam $MAPPINGPATH/SRR1691642/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691643/SRR1691643_WT.sam $MAPPINGPATH/SRR1691643/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691644/SRR1691644_WT.sam $MAPPINGPATH/SRR1691644/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691645/SRR1691645_Normal.sam $MAPPINGPATH/SRR1691645/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691646/SRR1691646_Normal.sam $MAPPINGPATH/SRR1691646/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691647/SRR1691647_Normal.sam $MAPPINGPATH/SRR1691647/accepted_hits.bam
samtools view -h -o $MAPPINGPATH/SRR1691648/SRR1691648_Normal.sam $MAPPINGPATH/SRR1691648/accepted_hits.bam

# Correcting read names of the paired reads
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691633/SRR1691633_ZRSR2Mut.sam 
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691634/SRR1691634_ZRSR2Mut.sam 
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691635/SRR1691635_ZRSR2Mut.sam 
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691636/SRR1691636_ZRSR2Mut.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691637/SRR1691637_ZRSR2Mut.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691638/SRR1691638_ZRSR2Mut.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691639/SRR1691639_ZRSR2Mut.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691640/SRR1691640_ZRSR2Mut.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691641/SRR1691641_WT.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691642/SRR1691642_WT.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691643/SRR1691643_WT.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691644/SRR1691644_WT.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691645/SRR1691645_Normal.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691646/SRR1691646_Normal.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691647/SRR1691647_Normal.sam
sed -ri -- 's/\.2\t|\.1\t/\t/' $MAPPINGPATH/SRR1691648/SRR1691648_Normal.sam


# Convert sam files with correct ids back to bam
nohup samtools view -bS -o $MAPPINGPATH/SRR1691633/SRR1691633_ZRSR2Mut.bam $MAPPINGPATH/SRR1691633/SRR1691633_ZRSR2Mut.sam &
nohup samtools view -bS -o $MAPPINGPATH/SRR1691634/SRR1691634_ZRSR2Mut.bam $MAPPINGPATH/SRR1691634/SRR1691634_ZRSR2Mut.sam &
nohup samtools view -bS -o $MAPPINGPATH/SRR1691635/SRR1691635_ZRSR2Mut.bam $MAPPINGPATH/SRR1691635/SRR1691635_ZRSR2Mut.sam &
samtools view -bS -o $MAPPINGPATH/SRR1691636/SRR1691636_ZRSR2Mut.bam $MAPPINGPATH/SRR1691636/SRR1691636_ZRSR2Mut.sam
samtools view -bS -o $MAPPINGPATH/SRR1691637/SRR1691637_ZRSR2Mut.bam $MAPPINGPATH/SRR1691637/SRR1691637_ZRSR2Mut.sam
samtools view -bS -o $MAPPINGPATH/SRR1691638/SRR1691638_ZRSR2Mut.bam $MAPPINGPATH/SRR1691638/SRR1691638_ZRSR2Mut.sam
samtools view -bS -o $MAPPINGPATH/SRR1691639/SRR1691639_ZRSR2Mut.bam $MAPPINGPATH/SRR1691639/SRR1691639_ZRSR2Mut.sam
samtools view -bS -o $MAPPINGPATH/SRR1691640/SRR1691640_ZRSR2Mut.bam $MAPPINGPATH/SRR1691640/SRR1691640_ZRSR2Mut.sam
samtools view -bS -o $MAPPINGPATH/SRR1691641/SRR1691641_WT.bam $MAPPINGPATH/SRR1691641/SRR1691641_WT.sam
samtools view -bS -o $MAPPINGPATH/SRR1691642/SRR1691642_WT.bam $MAPPINGPATH/SRR1691642/SRR1691642_WT.sam
samtools view -bS -o $MAPPINGPATH/SRR1691643/SRR1691643_WT.bam $MAPPINGPATH/SRR1691643/SRR1691643_WT.sam
samtools view -bS -o $MAPPINGPATH/SRR1691644/SRR1691644_WT.bam $MAPPINGPATH/SRR1691644/SRR1691644_WT.sam
samtools view -bS -o $MAPPINGPATH/SRR1691645/SRR1691645_Normal.bam $MAPPINGPATH/SRR1691645/SRR1691645_Normal.sam
samtools view -bS -o $MAPPINGPATH/SRR1691646/SRR1691646_Normal.bam $MAPPINGPATH/SRR1691646/SRR1691646_Normal.sam
samtools view -bS -o $MAPPINGPATH/SRR1691647/SRR1691647_Normal.bam $MAPPINGPATH/SRR1691647/SRR1691647_Normal.sam
samtools view -bS -o $MAPPINGPATH/SRR1691648/SRR1691648_Normal.bam $MAPPINGPATH/SRR1691648/SRR1691648_Normal.sam


# Index the corrected bam
samtools index $MAPPINGPATH/SRR1691633/SRR1691633_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691634/SRR1691634_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691635/SRR1691635_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691636/SRR1691636_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691637/SRR1691637_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691638/SRR1691638_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691639/SRR1691639_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691640/SRR1691640_ZRSR2Mut.bam
samtools index $MAPPINGPATH/SRR1691641/SRR1691641_WT.bam
samtools index $MAPPINGPATH/SRR1691642/SRR1691642_WT.bam
samtools index $MAPPINGPATH/SRR1691643/SRR1691643_WT.bam
samtools index $MAPPINGPATH/SRR1691644/SRR1691644_WT.bam
samtools index $MAPPINGPATH/SRR1691645/SRR1691645_Normal.bam
samtools index $MAPPINGPATH/SRR1691646/SRR1691646_Normal.bam
samtools index $MAPPINGPATH/SRR1691647/SRR1691647_Normal.bam
samtools index $MAPPINGPATH/SRR1691648/SRR1691648_Normal.bam

