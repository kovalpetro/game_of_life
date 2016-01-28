require_relative "./test_helper"

describe "Cell" do
  before do
    seed = [[1, 2], [2, 2], [3, 2]]
    @size = [3, 3]
    @playground = Playground.new(@size, seed)
    @array = @playground.cells
    @new_matrix = MatrixRepresentation.new(@array, @size)
  end

  let(:alive_cells) { ["0", "0", "0"] }
  let(:dead_cels)   { [".", ".", "."] }

  it "#new" do
    @new_matrix.arr.must_equal @array
    @new_matrix.elem_in_arr.must_equal @size[0]
  end

  it "#prepare" do
    matrix = @new_matrix.prepare
    matrix.must_be_kind_of Array
    matrix.each_with_index do |array, index|
      array.must_be_kind_of Array
      array.must_equal alive_cells if index == 1
      array.must_equal dead_cels unless index == 1
    end
  end
end
