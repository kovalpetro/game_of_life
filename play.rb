Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
require "pry"
require "tty"

# Example 1
# size = [4, 4]
# seed = [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]]

# Example 2
# size = [3, 3]
# seed = [[1, 2], [2, 2], [3, 2]]

# Example 3
size = [16, 16]
seed = [[8, 4], [8, 5], [8, 7], [8, 8], [8, 9], [8, 10], [8, 12], [8, 13], [7, 6], [9, 6], [7, 11], [9, 11]]
puts "Enter number of iterations"
iter = gets.chomp.to_i
playground = Playground.new(size, seed)
playground_snapshots = []
playground_snapshots << Marshal.dump(playground)

iter.times do
  UnderPopulationRule.use(playground)
  OverPopulationRule.use(playground)
  BornRule.use(playground)
  playground = NextIteration.save(playground)
  playground_snapshots << Marshal.dump(playground)
end

playground_snapshots.each do |pg|
  array = MatrixRepresentation.new(Marshal.load(pg).cells, size).prepare
  table = TTY::Table[*array]
  puts "\e[H\e[2J"
  puts table.to_s
  sleep 0.5
end
puts "\e[H\e[2J"
