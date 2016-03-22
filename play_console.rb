Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }

puts "Enter size of playground"
size = gets.chomp.to_i
puts "Enter number of iterations"
iter = gets.chomp.to_i

life_cycle = LifeCycle.new(CsvLoader.load("example_3.csv"), size, iter)

Support::ConsoleWrite.show(life_cycle.start, size)
