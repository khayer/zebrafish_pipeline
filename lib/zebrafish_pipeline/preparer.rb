require 'zebrafish_pipeline/picard_caller'
require 'zebrafish_pipeline/gatk_caller'

class Preparer

  attr_accessor :bam_file

  def initialize()
    @bam_file = nil
  end

  def execute(cmd)
    status = system(cmd)
    raise cmd unless status
  end

  def run(options)
    # tmp files for output
    job_number = options[:number]
    bam_file = "aligned_#{job_number}.bam"
    job_prefix = "#{job_number}"
    log_file = "#{job_number}.log"

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