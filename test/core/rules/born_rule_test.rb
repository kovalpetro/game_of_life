describe "BornRule" do
  before do
    @seed_to_born = [[1, 1], [1, 2], [2, 1]]
    @size = 3
    @playground = Core::DataStructure::Playground.new(@size, @seed_to_born)
  end

  it "should set cell's current_state as alive if it had 3 neighbors" do
    Core::Rules::BornRule.use(@playground)
    @playground.cells[4].current_state.must_equal true
  end

  it "should not change cell's current_state using born rule" do
    Core::Rules::BornRule.use(@playground)
    @playground.cells[2].current_state.must_equal false
  end
end
