class Cell
  attr_reader :x, :y, :alive, :current_state

  def initialize(pos, alive = false)
    @x = pos.x
    @y = pos.y
    @alive = @current_state = alive
  end

  def die
    @current_state = false
  end

  def born
    @current_state = true
  end

  def apply_state
    @alive = current_state
  end
end
