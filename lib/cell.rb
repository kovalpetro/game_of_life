class Cell

  attr_reader :x, :y, :alive

  def initialize(pos, alive = false)
    @x = pos.x
    @y = pos.y
    @alive = alive
  end
end