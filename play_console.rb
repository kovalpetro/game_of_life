Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }

puts "Enter number of iterations"
iter = gets.chomp.to_i
puts "Enter path to example csv file"
path = gets.chomp
data = CsvLoader.new(path)
Support::ConsoleWrite.show(LifeCycle.new(data.load, data.size, iter).start, data.size)
