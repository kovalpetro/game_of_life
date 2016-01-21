require_relative "./test_helper"

describe "DeathRule" do
  before do
    @seed_low = [[1, 1], [2, 2]]
    @seed_high = [[1, 1], [1, 2], [1, 3], [2, 1], [3, 1], [2, 2]]
    @size = [3, 3]
    @playground_low = Playground.new(@size, @seed_low)
    @playground_high = Playground.new(@size, @seed_high)
  end

  it "should set cell as dead if it had less than 2 neighbors" do
    playground_low = DeathRule.use(@playground_low)
    playground_low.cells[4].alive.must_equal false
  end

  it "should set cell as dead if it had more than 3 neighbors" do
    # binding.pry
    playground_high = DeathRule.use(@playground_high)
    playground_high.cells[1].alive.must_equal false
  end

  it "should not change cell status using death rule" do
    playground_high = DeathRule.use(@playground_high)
    playground_high.cells[0].alive.must_equal true
  end
end
