require_relative "./test_helper"

describe "Position" do

  before do
    @x = 1
    @y = 1
    @pos = Position.new(@x, @y)
  end

  it "#new" do
    @pos.x.must_equal @x
    @pos.y.must_equal @y
  end
end
