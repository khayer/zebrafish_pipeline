class GatkCaller
  prep_realign = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T RealignerTargetCreator -I WT_aligned_sorted.dedup.bam -I Mut_aligned_sorted_rg_dublicates.bam -R ~/Downloads/indexes/danRer7.fa -o TargetIntervals"
  realign = "java -Xmx4g -jar ~/Downloads/GenomeAnalysisTK-1.6-5-g557da77/GenomeAnalysisTK.jar -T IndelRealigner -I WT_aligned_sorted.dedup.bam -I Mut_aligned_sorted_rg_dublicates.bam -targetIntervals TargetIntervals.intervals -o both_realigned.bam -R ~/Downloads/indexes/danRer7.fa "

end