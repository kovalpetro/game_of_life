class Playground
  
  attr_reader :width, :height, :seed

  def initialize(size, seed = [])
    @width = size[0]
    @height = size[1]
    @seed = seed
  end
end