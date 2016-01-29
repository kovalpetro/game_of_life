require_relative "test_helper"

describe "Playground" do
  before do
    @seed = [[1, 1], [2, 2], [3, 3]]
    @size = 3
    @playground = Playground.new(@size, @seed)
  end

  let(:neighbors_of_first_cell) { [[1, 2], [2, 1], [2, 2]] }
  let(:neighbors_of_fifth_cell) { [[1, 1], [2, 1], [3, 1], [1, 2], [1, 3], [3, 2], [2, 3], [3, 3]] }
  let(:neighbors_of_ninth_cell) { [[3, 2], [2, 2], [2, 3]] }

  it "input data must be Array" do
    @seed.must_be_kind_of Array
    @size.must_be_kind_of Fixnum
  end

  it "#new" do
    @playground.height.must_equal @size
    @playground.width.must_equal @size
  end

  it "#fill_in" do
    seeded_cells = @playground.cells.select { |seeded| @seed.include?([seeded.x, seeded.y]) }
    seeded_cells.each do |cell|
      cell.must_be_kind_of Cell
      cell.alive.must_equal true
      cell.current_state.must_equal true
    end
  end

  describe "#neighbors_of" do
    it "should check correct neighbors of first cell" do
      cell = @playground.cells.first
      neighbors = @playground.neighbors_of(cell)
      neighbors.each do |neighbor|
        neighbor.must_be_kind_of Cell
        neighbors_of_first_cell.must_include [neighbor.x, neighbor.y]
      end
    end

    it "should check correct neighbors of fifth cell" do
      cell = @playground.cells[4]
      neighbors = @playground.neighbors_of(cell)
      neighbors.each do |neighbor|
        neighbor.must_be_kind_of Cell
        neighbors_of_fifth_cell.must_include [neighbor.x, neighbor.y]
      end
    end

    it "should check correct neighbors of ninth cell" do
      cell = @playground.cells.last
      neighbors = @playground.neighbors_of(cell)
      neighbors.each do |neighbor|
        neighbor.must_be_kind_of Cell
        neighbors_of_ninth_cell.must_include [neighbor.x, neighbor.y]
      end
    end
  end
end
