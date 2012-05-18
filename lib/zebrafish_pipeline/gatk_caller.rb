class GatkCaller
  prep_realign = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T RealignerTargetCreator -I WT_aligned_sorted.dedup.bam -I Mut_aligned_sorted_rg_dublicates.bam -R ~/Downloads/indexes/danRer7.fa -o TargetIntervals"
  realign = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T IndelRealigner -I WT_aligned_sorted.dedup.bam -I Mut_aligned_sorted_rg_dublicates.bam -targetIntervals TargetIntervals.intervals -o both_realigned.bam -R ~/Downloads/indexes/danRer7.fa "
  prep_recalibration = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T CountCovariates -R ~/Downloads/indexes/danRer7.fa -knownSites ~/Downloads/parental_variants/zebrafish_variants_2.vcf -I both_realigned.bam -cov ReadGroupCovariate -cov QualityScoreCovariate -cov DinucCovariate -cov CycleCovariate -recalFile both_realigned_bam.recal_data.csv"
  recalibrate = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T TableRecalibration -R ~/Downloads/indexes/danRer7.fa -I both_realigned.bam -o both_realigned_recal.bam -recalFile both_realigned_bam.recal_data.csv"
  gatk_unified_genotyper= "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar --num_threads 3 -T UnifiedGenotyper -R ~/Downloads/indexes/danRer7.fa -I both_realigned_recal.bam --dbsnp ~/Downloads/parental_variants/zebrash_variants_2.vcf -o snps.raw.vcf --genotype_likelihoods_model BOTH --max_alternate_alleles 7"
end