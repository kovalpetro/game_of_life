require_relative "./test_helper"

describe "BornRule" do
  before do
    @seed_to_born = [[1, 1], [1, 2], [2, 1]]
    @size = 3
    @playground = Playground.new(@size, @seed_to_born)
  end

  it "should set cell's current_state as alive if it had 3 neighbors" do
    Rules::BornRule.use(@playground)
    @playground.cells[4].current_state.must_equal true
  end

  it "should not change cell's current_state using born rule" do
    Rules::BornRule.use(@playground)
    @playground.cells[2].current_state.must_equal false
  end
end
