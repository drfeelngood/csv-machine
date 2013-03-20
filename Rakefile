require File.dirname(__FILE__) + '/lib/csv-machine/version'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = 'test/test_csv-machine.rb'
  t.verbose = true
end

desc "Build RubyGem"
task :gem do
  sh "gem build csv-machine.gemspec"  
end

desc "Tag the project with the current version"
task :tag do
  sh "git tag v#{CSVMachine::Version}"
end

desc "Publish RubyGem and source code"
task :publish => [ :gem, :tag ] do
  sh "git push origin v#{CSVMachine::Version}"
  sh "git push origin master"
  sh "git push csv-machine-#{CSVMachine::Version}.gem"
end
