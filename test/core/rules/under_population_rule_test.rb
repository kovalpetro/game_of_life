describe "UnderPopuldatinRule" do
  before do
    @seed = [[1, 1], [3, 1], [2, 2], [2, 3], [3, 3]]
    @size = 3
    @playground = Core::DataStructure::Playground.new(@size, @seed)
  end

  it "should set cell's current_state as dead if it had less than 2 neighbors" do
    Core::Rules::UnderPopulationRule.use(@playground)
    @playground.cells[0].current_state.must_equal false
  end

  it "should not change cell's current_state using under populdation rule" do
    Core::Rules::UnderPopulationRule.use(@playground)
    @playground.cells[4].current_state.must_equal true
  end
end
