require_relative "./test_helper"

describe "NextIteration" do
  before do
    @seed= [[1, 1], [2, 2], [3, 3]]
    @size = [3, 3]
    @playground = Playground.new(@size, @seed)
  end

  it "should save current state of playground for next iteration" do
    new_playground = NextIteration.save(@playground)
    new_playground.cells[0].alive.must_equal true
    new_playground.cells[4].alive.must_equal true
    new_playground.cells[8].alive.must_equal true
  end
end
