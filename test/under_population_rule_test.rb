require_relative "./test_helper"

describe "OverPopuldatinRule" do
  before do
    @seed = [[1, 1],[3, 1], [2, 2],[2, 3], [3, 3]]
    @size = [3, 3]
    @playground = Playground.new(@size, @seed)
  end

  it "should set cell as dead if it had less than 2 neighbors" do
    playground = UnderPopulationRule.use(@playground)
    playground.cells[0].alive.must_equal false
  end

  it "should not change cell status using under populdation rule" do
    playground = UnderPopulationRule.use(@playground)
    playground.cells[4].alive.must_equal true
  end
end
