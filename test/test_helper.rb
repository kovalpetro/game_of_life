require "minitest/autorun"

test_helper_dir = File.dirname(__FILE__)
root_dir = File.join(test_helper_dir, '..')

Dir[File.join(root_dir, "lib", "*.rb")].each { |f| require f }
