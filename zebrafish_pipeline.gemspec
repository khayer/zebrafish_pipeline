Gem::Specification.new do |s|
  s.name        = "zebrafish_pipeline"
  s.version     = "0.0.1"
  s.date        = "2012-05-09"
  s.authors     = ["Kaharina Hayer"]
  s.email       = ["katharinaehayer@gmail.com"]
  s.homepage    = "https://github.com/khayer/zebrafish_pipeline"
  s.summary     = %q{Call Mutations for files.fq in zebrafish}
  s.description = %q{Using BWA to align and GATK to call the bases}

  s.rubyforge_project = "zebrafish_pipeline"

  s.files         = `git ls-files -- {lib,bin}/*`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   << 'zebrafish_pipeline'
  #s.executables   << 'gatk_pipe_only_aws'
  #s.require_paths =  ["lib"]
end