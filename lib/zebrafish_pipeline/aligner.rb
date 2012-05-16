require 'zebrafish_pipeline/bwa_caller'
require 'zebrafish_pipeline/picard_caller'
require 'zebrafish_pipeline/gatk_caller'

class Aligner

  attr_accessor :sai_file_1, :sai_file2, :sam_file, :bam_file

  def initialize()
    @sai_file_1 = nil
    @sai_file_2 = nil
    @sam_file = nil
    @bam_file = nil
    @bam_file_sorted = nil
  end

  def self.add_options(options)
    true
  end

  def execute(cmd)
    status = system(cmd)
    raise cmd unless status
  end

  def run(options)
    # tmp files for output
    random = (rand*1000000).floor.to_s
    sam_file = "aligned_#{random}.sam"
    job_prefix = "#{random}"
    log_file = "#{random}.log"
    #target_intervals = "#{random}_target.intervals"
    #realigned_bam = "#{random}_realigned.bam"
    #recal_file = "#{random}_recal.csv"
    #recal_bam = "#{random}_recal.bam"
    @sai_file_1 = "#{random}_fwd.sai"
    @sai_file_2 = "#{random}_rev.sai"
    ## BWA : ALN
    cmd = BwaCaller.call_aln(options[:read_1], options[:reference_bwa],
      @sai_file_1, log_file, options[:bwa], job_prefix, options[:account],
      options[:debug])
    execute(cmd)
    cmd = BwaCaller.call_aln(options[:read_2], options[:reference_bwa],
      @sai_file_2, log_file, options[:bwa], job_prefix, options[:account],
      options[:debug])
    execute(cmd)

## BWA : First step mapping reads to reference
    cmd = BwaCaller.call_paired_end(options[:read_1], options[:read_2],
      @sai_file_1, @sai_file_2, sam_file, options[:reference_bwa],
      log_file, options[:bwa], job_prefix, options[:account],
      options[:debug])
    execute(cmd)

  end

end