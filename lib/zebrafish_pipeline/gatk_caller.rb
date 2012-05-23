class GatkCaller
  def self.call_paired_end(r1, r2, sai1, sai2,  out_file, index, log_file, bwa, job_prefix,account, debug)
    cmd = "qsub -o #{log_file} -hold_jid bwa_aln_#{job_prefix} -V -cwd -b y -N bwa_#{job_prefix} -l h_vmem=6G  #{account}\
      #{bwa} sampe #{index} \
      #{sai1} #{sai2}  #{r1} #{r2} -f #{out_file}"
  end

  #prep_realign = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T RealignerTargetCreator -I WT_aligned_sorted.dedup.bam -I Mut_aligned_sorted_rg_dublicates.bam -R ~/Downloads/indexes/danRer7.fa -o TargetIntervals"
  def self.prep_realign(gatk, infiles, reference_fa, target_intervals, log_file, job_prefix, account)
    # infiles: -I file1.bam -I file2.bam ...
    cmd = "qsub -o #{log_file} -hold_jid index_#{job_prefix} -V -cwd -b y -N prep_realign_#{job_prefix} -l h_vmem=6G  #{account} \
      java -Xmx4g -jar #{gatk} -T RealignerTargetCreator #{infiles} \
      -R #{reference} -o #{target_intervals}"
  end

  #realign = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T IndelRealigner -I WT_aligned_sorted.dedup.bam -I Mut_aligned_sorted_rg_dublicates.bam -targetIntervals TargetIntervals.intervals -o both_realigned.bam -R ~/Downloads/indexes/danRer7.fa "
  def self.prep_realign(gatk, infiles, reference_fa, target_intervals, all_bam ,log_file, job_prefix, account)
    # infiles: -I file1.bam -I file2.bam ...
    cmd = "qsub -o #{log_file} -hold_jid prep_realign_#{job_prefix} -V -cwd -b y -N realign_#{job_prefix} -l h_vmem=6G  #{account} \
      java -Xmx4g -jar #{gatk} -T IndelRealigner #{infiles} \
      -R #{reference} -targetIntervals #{target_intervals}  -o #{all_bam}"
  end

  #prep_recalibration = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T CountCovariates -R ~/Downloads/indexes/danRer7.fa -knownSites ~/Downloads/parental_variants/zebrafish_variants_2.vcf -I both_realigned.bam -cov ReadGroupCovariate -cov QualityScoreCovariate -cov DinucCovariate -cov CycleCovariate -recalFile both_realigned_bam.recal_data.csv"
  def self.prep_recalibration(gatk, infiles, reference_fa, target_intervals, all_bam ,log_file, job_prefix, account)

    cmd = "qsub -o #{log_file} -hold_jid prep_realign_#{job_prefix} -V -cwd -b y -N realign_#{job_prefix} -l h_vmem=6G  #{account} \
      java -Xmx4g -jar #{gatk} -T CountCovariates #{infiles} \
      -R #{reference} -targetIntervals #{target_intervals}  -o #{all_bam}"
  end


  recalibrate = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T TableRecalibration -R ~/Downloads/indexes/danRer7.fa -I both_realigned.bam -o both_realigned_recal.bam -recalFile both_realigned_bam.recal_data.csv"
  gatk_unified_genotyper= "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar --num_threads 3 -T UnifiedGenotyper -R ~/Downloads/indexes/danRer7.fa -I both_realigned_recal.bam --dbsnp ~/Downloads/parental_variants/zebrash_variants_2.vcf -o snps.raw.vcf --genotype_likelihoods_model BOTH --max_alternate_alleles 7"
end