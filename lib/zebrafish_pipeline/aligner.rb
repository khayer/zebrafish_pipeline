require 'zebrafish_pipeline/bwa_caller'
require 'zebrafish_pipeline/picard_caller'

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
    5
  end

  def run()
    "It worked"
  end

end