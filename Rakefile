# encoding: utf-8

require 'rubygems'
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.version = '0.1.1'
  gem.name = "multidisk-boxgrinder-plugin"
  gem.homepage = "http://github.com/rubiojr/multidisk-boxgrinder-plugin"
  gem.license = "MIT"
  gem.summary = %Q{BoxGrinder plugin to convert raw images to VMDK Stream Optimize}
  gem.description = %Q{BoxGrinder plugin to convert raw images to VMDK Stream Optimize}
  gem.email = "rubiojr@frameos.org"
  gem.authors = ["Sergio Rubio"]
  # dependencies defined in Gemfile
  gem.add_dependency "boxgrinder-build", ">= 0.10"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :build

#require 'rdoc/task'
#Rake::RDocTask.new do |rdoc|
#  version = File.exist?('VERSION') ? File.read('VERSION') : ""
#
#  rdoc.rdoc_dir = 'rdoc'
#  rdoc.title = "multidisk-boxgrinder-plugin #{version}"
#  rdoc.rdoc_files.include('README*')
#  rdoc.rdoc_files.include('lib/**/*.rb')
#end
