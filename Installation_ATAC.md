## Installation Guide for Practical Couse of SOSE 2021 (Part 2)

```terminal
## Environment: Linux 64 bits
## The tools are tested on Linux Mint 20.1 - Ulyssa, 64bit. and Ubuntu 20.04
```

### 1. SRA toolkit
The SRA Toolkit is a collection of tools and libraries for using data in the NCBI Sequence Read Archives. Download the latest software at
```terminal
https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit
```
And place the binaries in any folder contained in your $PATH. Make sure they are executable (770). See [here](https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit) for more information about installing SRA toolkit.

### 2. Bowtie 2
Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences, you can install it by
```terminal
sudo apt install bowtie2
```
If you are interested in the details, find [here](https://www.nature.com/articles/nmeth.1923) the paper.

### 3. Samtools
Samtools is a suite of programs for interacting with high-throughput sequencing data. We will use it for further processing the aligned data. 
```terminal
sudo apt install samtools
```

### 4. MACS2
MACS2 (Model-based Analysis for ChIP-Seq) is a tool for identifying regions with enriched reads. Though this method was originally developed for ChIP-Seq, now it becomes the standard tool for analysis other NGS data, such as ATAC-seq.
```terminal
pip install --user macs2
```

### 5. RGT

RGT is an open source Python 3.6+ library for analysis of regulatory genomics developed by CostaLab. The RGT toolbox is made of a core library and several tools. We will use it to perform motif matching in this tutorial.

```terminal
pip install RGT

# setup genomic data
cd ~/rgtdata
python setupGenomicData.py --mm10
```
