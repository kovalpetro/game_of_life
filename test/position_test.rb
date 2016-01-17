require_relative "./test_helper"

describe "Position" do

  it "#new" do
    x = 1
    y = 1
    pos = Position.new(x, y)
    pos.x.must_equal x
    pos.y.must_equal y
  end
end
