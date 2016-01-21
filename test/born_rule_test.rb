require_relative "./test_helper"

describe "BornRule" do
  before do
    @seed_to_born = [[1, 1], [1, 2], [2, 1]]
    @size = [3, 3]
    @playground = Playground.new(@size, @seed_to_born)
  end

  it "should set cell as alive if it had 3 neighbors" do
    playground = BornRule.use(@playground)
    playground.cells[4].alive.must_equal true
  end

  it "should not change cell status using born rule" do
    playground = DeathRule.use(@playground)
    playground.cells[2].alive.must_equal false
  end
end
