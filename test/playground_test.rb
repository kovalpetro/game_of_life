require_relative "test_helper"

describe "Playground" do
  before do
    @seed = [[1, 1], [2, 2], [3, 3]]
    @size = [3, 3]
    @playground = Playground.new(@size, @seed)
  end

  it "input data must be Array" do
    @seed.must_be_kind_of Array
    @size.must_be_kind_of Array
  end

  it "#new" do
    @playground.height.must_equal @size[1]
    @playground.width.must_equal @size[0]
  end

  it "#fill_in" do
    seeded_cells = @playground.cells.select { |seeded| @seed.include?([seeded.x, seeded.y]) }
    seeded_cells.each do |cell|
      cell.must_be_kind_of Cell
      cell.alive.must_equal true
    end
  end
end
