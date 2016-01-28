Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
require "pry"
require "matrix"

# size = [4, 4]
# seed = [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]]
size = [3, 3]
seed = [[1, 2], [2, 2], [3, 2]]
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
  puts "---------------Iteration---------------------"
  array = ArrayCreator.new(Marshal.load(pg).cells, size).splitter
  array.each { |arr| p arr }
end
