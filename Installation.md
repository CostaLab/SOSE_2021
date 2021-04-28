# Installation Guide for SOSE 2021

```terminal
## Environment: Linux 64 bits
## The tools are tested on Linux Mint 20.1 - Ulyssa, 64bit. and Ubuntu 20.04
```

### 0. Install JAVA if you don't have it
```terminal
sudo apt install default-jre
```

### 1. Download fastqc
```terminal
mkdir -p ~/Downloads/bin
cd ~/Downloads/bin 
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip
unzip fastqc_v0.11.9.zip
rm fastqc_v0.11.9.zip
# make sure that fastqc is executable
sudo chmod 770 FastQC/fastqc
```

### 2. Download trim galore
```terminal
cd ~/Downloads/bin
wget https://github.com/FelixKrueger/TrimGalore/archive/0.6.5.zip
unzip 0.6.5.zip
rm 0.6.5.zip
```
### 3. Install samtools
```terminal
sudo apt install samtools # For Ubuntu-based distributions
```
### 4. Install python3.9 and pip
```terminal
# check if you already have it installed with 
python3 --version
# if not run
# sudo apt install python3.9
sudo apt install python3-pip
pip3 install --user --upgrade cutadapt
# Also set ~/.local/bin to be part of your PATH in the .bashrc file.
# Add:     export PATH=/home/$USER/.local/bin:$PATH     to ~/.bashrc file
# 
```
### 5. Install STAR aligner
```terminal
cd ~/Downloads/bin
wget https://github.com/alexdobin/STAR/archive/master.zip
unzip master.zip
# you will also need some dependencies
sudo apt install zlib1g-dev
cd STAR-master/source
make STAR
# install missing dependencies if any discovered during installation
```
### 6. Install IGV (2.4.9)
```terminal
cd ~/Downloads/bin
wget https://data.broadinstitute.org/igv/projects/downloads/2.9/IGV_Linux_2.9.4_WithJava.zip
unzip IGV_Linux_2.9.4_WithJava.zip
rm IGV_Linux_2.9.4_WithJava.zip
```
### 7. Install newest R and R-Studio

```terminal
sudo apt install apt-transport-https software-properties-common libclang-dev libcurl4-openssl-dev libssl-dev
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt update
sudo apt install r-base
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1106-amd64.deb
sudo dpkg -i rstudio-1.4.1106-amd64.deb
# Install missing dependencies in linux (if any)
# from R install additional packages 
R
> install.packages("dplyr")
> install.packages("Seurat")
> install.packages("devtools")
> devtools::install_github('satijalab/seurat-data')
> install.packages("https://seurat.nygenome.org/src/contrib/ifnb.SeuratData_3.0.0.tar.gz", repos = NULL, type = "source")
```

### 8. SRA toolkit
```terminal
Download the latest software at:
http://www.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?cmd=show&f=software&m=software&s=software

And place the binaries in any folder contained in your $PATH. Make sure they are executable (770).
```
### 9. Bedtools
```terminal
sudo apt install bedtools
```

### 10. Bowtie 2
```terminal
sudo apt install bowtie2
```
### 11. samtools
```terminal
sudo apt install samtools
```
### 12. MACS2
```terminal
pip install --user macs2
```
### 13. RGT
```terminal
pip install RGT
cd ~/rgtdata

```
