Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }

puts "Enter size of playground"
size = gets.chomp.to_i
puts "Enter number of iterations"
iter = gets.chomp.to_i
puts "Enter path to example csv file"
path = gets.chomp

Support::ConsoleWrite.show(LifeCycle.new(CsvLoader.load(path), size, iter).start, size)
