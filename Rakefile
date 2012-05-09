require 'rake/testtask'
`rm zebrafish_pipeline-*.gem`
`gem build zebrafish_pipeline.gemspec`
`gem install zebrafish_pipeline-*.gem`

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
  #t.libs << 'test'
end

desc "Run tests"
task :default => :test