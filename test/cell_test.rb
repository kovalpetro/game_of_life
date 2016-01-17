require_relative "./test_helper"

describe "Cell" do

  it "#new" do
    x = 1
    y = 1
    default_alive = false
    pos = Position.new(x, y)
    cell = Cell.new(pos)
    cell.x.must_equal pos.x
    cell.y.must_equal cell.y
    cell.alive.must_equal default_alive
  end
end
