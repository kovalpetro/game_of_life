Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require "pry"

size = [3, 3]
seed = [[1, 2], [2, 2], [3, 2]]
puts "Enter number of iterations"
iter = gets.chomp.to_i

playground = Playground.new(size, seed)

iter.times do |i|
  puts "---------------Iteration #{i + 1}---------------------"
  playground_under_rule = UnderPopulationRule.use(playground)
  playground_over_rule = OverPopulationRule.use(playground_under_rule)
  playground_born_rule = BornRule.use(playground_over_rule)
  playground = NextIteration.save(playground_born_rule)
  playground.cells.each { |cell| puts "[#{cell.x}, #{cell.y}], alive = #{cell.alive}" }
end
