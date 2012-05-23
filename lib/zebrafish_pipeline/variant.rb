require 'zebrafish_pipeline/gatk_caller'

class Variant

  attr_accessor :bam_file

  def initialize()
    @bam_file = nil
  end

  def execute(cmd)
    puts cmd
    status = system(cmd)
    raise cmd unless status
  end

  def run(options)
    # tmp files for output
    job_number = options[:job_number]
    bam_file = "aligned_#{job_number}.bam"
    bam_file_sorted = "sorted_#{job_number}.bam"
    bam_file_sorted_dublicates = options[:output_dir]
    dublicate_metrcis = "dublicate_#{job_number}.metrics"

    job_prefix = "#{job_number}"
    log_file = "#{job_number}.log"


    cmd = PicardCaller.convert(options[:sam_file], bam_file, options[:picard_tools],
      log_file, job_prefix, options[:account])
    execute(cmd)

    cmd = PicardCaller.rg_and_sorting(bam_file, bam_file_sorted, options[:picard_tools],
      options[:library], options[:index], options[:sample_name],
      log_file, job_prefix, options[:account])
    execute(cmd)

    cmd = PicardCaller.mark_dublicates(bam_file_sorted, bam_file_sorted_dublicates,
      dublicate_metrcis, options[:picard_tools], log_file, job_prefix,
      options[:account])
    execute(cmd)

    cmd = PicardCaller.build_index(bam_file_sorted_dublicates,
      options[:picard_tools], log_file, job_prefix, options[:account])
    execute(cmd)

  end

end