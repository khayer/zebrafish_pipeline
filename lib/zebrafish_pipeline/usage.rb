require 'zebrafish_pipeline/version'

class Usage
  attr_accessor :usage

  def initialize()
    @usage =<<EOF
    _________________________________________________________________________________________________

      zebrafish_pipeline <command> [options]

      Command:    align       fastq -> aligned_sorted.bam
                  variant     bam-files -> vcf.files
                  compare     input: vcf.files

    _________________________________________________________________________________________________

      zebrafish_pipeline ...
      ... is a tool to find mutations between the reference gene and a given test
      population. To run this tool you must have bwa, samtools and GATK installed.
      Also you should have the indices for bwa and GATK prepared.
      NOTE: Only paired end reads are supported!

                          +++ V E R S I O N - #{Version.new().get_version} +++

      config.yml should look like this:
      # config.yml
      index_prefix: 'path/to/prefix'
      annotation_file: 'path/to/annotation_file'
      bwa: 'path/to/bwa'
      samtools: 'path/to/samtools'
      gatk: 'path/to/GenomeAnalysisTK.jar'
    _________________________________________________________________________________________________

EOF
  @usage_align =<<EOF
     zebrafish_pipeline align [options]
EOF

  end


end