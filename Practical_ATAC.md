## Analysis of ATAC-seq data

### Aims
In this script, we will show you how to analyse NGS data from open chromatin protocal. We will use ATAC-seq for MPP (SRR1533863) and B (SRR1533847) cells from GEO with accession GSE26328 and we will perform reads alignment, peak calling and motif matching. We assume that all tools have been installed properly, otherwise please first install them following the guild [here]().

### Reference
* Paper: http://science.sciencemag.org/content/345/6199/943.long
* Data: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE26328

### 1. Download Data
We download all data for analysis in this section.

#### 1.1 Convert SRA to FASTQ

SRA file is a compressed version of FASTQ file. When the downloading is  done, we can convert the file format from SRA to FASTQ using SRA toolkit
```terminal
fastq-dump ./SRR1533863.sra
fastq-dump ./SRR1533847.sra
```
Finally, let's rename the file names
```terminal
mv SRR1533863.fastq MPP.fastq
mv SRR1533847.fastq B.fastq
```
#### 1.2 Download reference genome
Since we dont have enough time to analyse the data in a genome-wide manner, we here only download the reference sequence for chromosome 19
```terminal
wget http://hgdownload.soe.ucsc.edu/goldenPath/mm10/chromosomes/chr19.fa.gz
gunzip chr19.fa.gz
```

### 2. Short DNA Sequence Alignment

#### 2.1 Build genome’s index
Let's first create an index file for our reference genome using Bowtie2.

```terminal
bowtie2-build chr19.fa chr19
```

#### 2.2 Align reads to the genome
Next, we align the sequencing data to reference genome

```terminal
bowtie2 -x ./chr19 -U MPP.fastq -S MPP.sam -p 16
bowtie2 -x ./chr19 -U B.fastq -S B.sam -p 16
# here -x refers to location of the genome index, -U refers to input sequencign data, and -S refers to output file, -p refers to number of alignment threads to launch
```
When alignment is done, you will find two SAM files, namely, MPP.sam and B.sam, which include the position information for each input read. Bowtie2 also reports some statistical information about the alignment, such as
```terminal
21445660 reads; of these:
  21445660 (100.00%) were unpaired; of these:
    20247365 (94.41%) aligned 0 times
    439195 (2.05%) aligned exactly 1 time
    759100 (3.54%) aligned >1 times
5.59% overall alignment rate

19883576 reads; of these:
  19883576 (100.00%) were unpaired; of these:
    18411332 (92.60%) aligned 0 times
    461169 (2.32%) aligned exactly 1 time
    1011075 (5.08%) aligned >1 times
7.40% overall alignment rate
```
As we can see, as expected, the overal alignment rate is quite low because we only used chromosome 19 as reference.

#### 2.3 Generate BAM file
We next convert SAM file to BAM file, which is a compressed version of SAM file
```terminal
samtools view -bS -@ 16 MPP.sam > MPP.bam
samtools view -bS -@ 16 B.sam > B.bam
# -b output BAM
# -S auto detect input format
# -@ Number of additional threads to use
```

We sort reads in BAM file by genomic location
```terminal
samtools sort -@ 16 MPP.bam -o MPP.sorted.bam
samtools sort -@ 16 B.bam -o B.sorted.bam
```

Finally, we remove reads with low map alignment and create an index for BAM file
```terminal
samtools view -bq 30 -@ 16 MPP.sorted.bam > MPP.final.bam
samtools view -bq 30 -@ 16 B.sorted.bam > B.final.bam
samtools index MPP.final.bam
samtools index B.final.bam
```

### 3. Peak Calling

Let's first create two folders for peaks
```terminal
mkdir PeaksMPP
mkdir PeaksB
```

Then we perform peak calling using MACS2
```terminal
macs2 callpeak -t MPP.final.bam -n MPP --outdir PeaksMPP -g mm
macs2 callpeak -t B.final.bam -n B --outdir PeaksB -g mm

# -g refers to genome size, It can be 1.0e+9 or 1000000000, or shortcuts:'hs' for human (2.7e9), 'mm' for mouse (1.87e9)
```

### 4. Motif Matching
We used RGT to perform motif matching
```terminal
rgt-motifanalysis matching --organism mm10 --input-files ./PeaksMPP/MPP_peaks.narrowPeak ./PeaksB/B_peaks.narrowPeak
```
