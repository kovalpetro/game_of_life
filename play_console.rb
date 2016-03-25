Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }

# Input data
puts "Enter number of iterations"
iter = gets.chomp.to_i
puts "Enter path to example csv file"
path = gets.chomp
seed_data = Support::CsvLoader.new(path)

# Core processing
cycles = Core::LifeCycle.new(seed_data.load, seed_data.size, iter)

# Console output
OutputStrategy::ConsoleOut.generate(cycles.start, cycles.size)
