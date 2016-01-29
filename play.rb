Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }

# Example 1
# seed = [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]]

# Example 2
# seed = [[1, 2], [2, 2], [3, 2]]

# Example 3
seed = [[8, 4], [8, 5], [8, 7], [8, 8], [8, 9], [8, 10], [8, 12], [8, 13], [7, 6], [9, 6], [7, 11], [9, 11]]

puts "Enter size of playground"
size = gets.chomp.to_i
puts "Enter number of iterations"
iter = gets.chomp.to_i

playground = Playground.new(size, seed)
playground_snapshots = []
playground_snapshots << Marshal.dump(playground)

iter.times do
  Rules::UnderPopulationRule.use(playground)
  Rules::OverPopulationRule.use(playground)
  Rules::BornRule.use(playground)
  playground = NextIteration.save(playground)
  playground_snapshots << Marshal.dump(playground)
end

Output.show(playground_snapshots, size)
