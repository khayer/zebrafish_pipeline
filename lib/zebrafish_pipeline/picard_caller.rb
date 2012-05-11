class PicardCaller


  converter = "java -jar ~/Downloads/picard-tools-1.56/picard-tools-1.56/SamFormatConverter.jar I=WT_aligned_sorted_rg.bam O=tmp.sam VALIDATION_STRINGENCY=LENIENT"
  rg_and_sorting = "java -jar -Xmx3g ~/Downloads/picard-tools-1.56/picard-tools-1.56/AddOrReplaceReadGroups.jar I=WT_aligned.bam O=WT_aligned_sorted_rg.bam SO=coordinate ID=15 LB=nina_library PL=Illumina PU=ATCATC SM=My_test VALIDATION_STRINGENCY=LENIENT"
  mark_dublicates = "java -jar ~/Downloads/picard-tools-1.56/picard-tools-1.56/MarkDuplicates.jar I=WT_aligned_sorted_rg.bam O=marked_dublicates.bam M=dublicate.metrcis AS=true VALIDATION_STRINGENCY=LENIENT"
  build_index = "java -jar ~/Downloads/picard-tools-1.56/picard-tools-1.56/BuildBamIndex.jar I=marked_dublicates.bam  VALIDATION_STRINGENCY=LENIENT"
end
