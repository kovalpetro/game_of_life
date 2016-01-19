require_relative "./test_helper"

describe "Cell" do
  before do
    @seed_low = [[1, 1], [2, 2]]
    @seed_high = [[1, 1], [1, 2], [1, 3], [2, 1], [3, 1], [2, 2]]
    @size = [3, 3]
    @playground_low = Playground.new(@size, @seed_low)
    @playground_high = Playground.new(@size, @seed_high)
  end

  it "should set cell as dead if it had less than 2 neighbors" do
    playground_low = DeathRule.use(@playground_low)
    playground_low[4].alive.must_equal false
  end

  it "should set cell as dead if it had more than 3 neighbors" do
    playground_high = DeathRule.use(@playground_high)
    playground_high[4].alive.must_equal false
  end
end
