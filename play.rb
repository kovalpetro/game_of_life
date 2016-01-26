Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require "pry"

size = [3, 3]
seed = [[1, 2], [2, 2], [3, 2]]
puts "Enter number of iterations"
iter = gets.chomp.to_i

playground = Playground.new(size, seed)

iter.times do |i|
  duplicate = playground.dup
  binding.pry
  UnderPopulationRule.use(duplicate)
  binding.pry
  OverPopulationRule.use()
  BornRule.use(playground_born)
  playground = NextIteration.save()
  puts "---------------Iteration #{i + 1}---------------------"
  playground.cells.each { |cell| puts "[#{cell.x}, #{cell.y}], alive = #{cell.alive}" }
end
