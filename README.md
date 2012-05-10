# Zebrafish BWA/PicardTools/GATK pipeline

This pipeline is suppose to automate all the necessary steps between raw sequenced data and called variations.

*_Note:_* This gem is under construction!

## The steps

### Aligning the fastq files containing the raw sequenced data with bwa

This gem is using the [Burrows-Wheeler Aligner](http://bio-bwa.sourceforge.net/)(BWA) to map the short reads back to the genome. This involves two steps:
1) `bwa align`
2) `bwa samse` for single- or `bwa sampe` for paired-end reads
BWA is used with default settings.

### Bam-file Conversion/Sort/Index with Picard tools

### Using Picard tools to add read groups

### Marking duplicates in each of the samples (picard tools)

### (Merge all the .bam files)

### Realigning with GATK

### Recalibration

### Unified Genotyper

### Evalution of .vcf files


