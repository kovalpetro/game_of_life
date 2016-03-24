require_relative "../test_helper"

describe "NextIteration" do
  before do
    @seed = [[1, 1], [2, 2], [3, 3]]
    @size = 3
    @playground = Core::Playground.new(@size, @seed)
  end

  it "should save state of playground for the next iteration" do
    @playground.cells[0].alive.must_equal true
    @playground.cells[4].alive.must_equal true
    @playground.cells[8].alive.must_equal true
    Core::Rules::UnderPopulationRule.use(@playground)
    new_playground = Core::NextIteration.save(@playground)
    new_playground.cells[0].alive.must_equal false
    new_playground.cells[4].alive.must_equal true
    new_playground.cells[8].alive.must_equal false
  end
end
