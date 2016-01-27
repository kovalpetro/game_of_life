require "rake/testtask"
require "ci/reporter/rake/minitest"
task test: "ci:setup:minitest"

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end
