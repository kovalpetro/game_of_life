Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require "pry"

size = [4, 4]
seed = [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]]
puts "Enter number of iterations"
iter = gets.chomp.to_i

playground = Playground.new(size, seed)

iter.times do |i|
  UnderPopulationRule.use(playground)
  OverPopulationRule.use(playground)
  BornRule.use(playground)
  playground = NextIteration.save(playground)
  puts "---------------Iteration #{i + 1}---------------------"
  playground.cells.each { |cell| puts "[#{cell.x}, #{cell.y}], alive = #{cell.alive}" }
end
