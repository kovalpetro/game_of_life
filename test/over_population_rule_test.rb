require_relative "./test_helper"

describe "OverPopuldatinRule" do
  before do
    @seed = [[1, 1], [1, 2], [1, 3], [2, 1], [3, 1], [2, 2]]
    @size = [3, 3]
    @playground = Playground.new(@size, @seed)
  end

  it "should set cell's current_state as dead if it had more than 3 neighbors" do
    OverPopulationRule.use(@playground)
    @playground.cells[1].current_state.must_equal false
  end

  it "should not change cell's current_state using under populdation rule" do
    OverPopulationRule.use(@playground)
    @playground.cells[0].current_state.must_equal true
  end
end
