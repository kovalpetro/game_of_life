require_relative "../test_helper"

describe "LifeCycle" do
  before do
    @size = 10
    @seed = [[2, 1], [2, 2], [2, 3]]
    @iter = 10
    @game = Core::LifeCycle.new(@seed, @size, @iter)
  end

  let(:alive_cells) { [11, 12, 13] }

  it "should set all data after initialization" do
    @game.seed.must_equal @seed
    @game.size.must_equal @size
    @game.iterations.must_equal @iter
  end

  it "should set 'client_strategy' as false by default" do
    @game.client_strategy.must_equal false
  end

  it "should set 'client_strategy' as true if put as an argument" do
    another_game = Core::LifeCycle.new(@seed, @size, @iter, true)
    another_game.client_strategy.must_equal true
  end

  it "should response correct result of processing" do
    snapshots = @game.start
    cells_from_first_playground = Marshal.load(snapshots.first).cells
    cells_from_first_playground.each.with_index(1) do |cell, index|
      cell.alive.must_equal(alive_cells.include? index)
    end
  end
end
