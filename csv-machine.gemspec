require File.dirname(__FILE__) + "/lib/csv-machine/version"

Gem::Specification.new do |s|
  s.name     = "csv-machine"
  s.version  = CSVMachine::Version
  s.author   = "Daniel Johnston"
  s.email    = "dan@dj-agiledev.com"
  s.homepage = "https://github.com/drfeelngood/csv-machine"
  s.date     = Time.now.strftime('%Y-%m-%d')

  s.files   = Dir["lib/**/*.rb"]

  s.description = "A machine for csv parsing"
  s.summary     = "Small library used to transform csv data to Ruby objects"
end
