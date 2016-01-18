require_relative "./test_helper"

describe "Cell" do
  before do
    @x = 1
    @y = 1
    @pos = Position.new(@x, @y)
    @cell = Cell.new(@pos)
  end

  let(:dead)  { false }
  let(:alive) { true }

  it "#new" do
    @cell.x.must_equal @x
    @cell.y.must_equal @y
    @cell.alive.must_equal dead
  end

  it "should create alive cell" do
    cell = Cell.new(@pos, true)
    cell.alive.must_equal alive
  end

  it "#die" do
    @cell.die
    @cell.alive.must_equal dead
  end

  it "#born" do
    @cell.born
    @cell.alive.must_equal alive
  end
end
