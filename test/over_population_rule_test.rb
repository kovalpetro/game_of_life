require_relative "./test_helper"

describe "OverPopuldatinRule" do
  before do
    @seed = [[1, 1], [1, 2], [1, 3], [2, 1], [3, 1], [2, 2]]
    @size = [3, 3]
    @playground = Playground.new(@size, @seed)
  end

  it "should set cell as dead if it had more than 3 neighbors" do
    playground = OverPopulationRule.use(@playground)
    playground.cells[1].alive.must_equal false
  end

  it "should not change cell status using under populdation rule" do
    playground = OverPopulationRule.use(@playground)
    playground.cells[0].alive.must_equal true
  end
end
