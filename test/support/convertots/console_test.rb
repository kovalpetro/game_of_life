describe "Console out" do
  before do
    pos1_1 = Core::DataStructure::Position.new(1, 1)
    pos2_1 = Core::DataStructure::Position.new(2, 1)
    pos1_2 = Core::DataStructure::Position.new(1, 2)
    pos2_2 = Core::DataStructure::Position.new(2, 2)
    cell1_1 = Core::DataStructure::Cell.new(pos1_1, true)
    cell2_1 = Core::DataStructure::Cell.new(pos2_1)
    cell1_2 = Core::DataStructure::Cell.new(pos1_2)
    cell2_2 = Core::DataStructure::Cell.new(pos2_2, true)
    @array = [cell1_1, cell2_1, cell1_2, cell2_2]
  end

  let(:out_data) { [["0", "."], [".", "0"]] }
  let(:size) { 2 }

  it "should return correct array" do
    Support::Convertors::Console.convert(@array, size).must_equal out_data
  end
end
