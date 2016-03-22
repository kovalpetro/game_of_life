class LifeCycle
  attr_reader :seed, :size, :iterations
  def initialize(seed, size, iterations)
    @seed = seed
    @size = size
    @iterations = iterations
  end

  def start
    [].tap do |playground_snapshots|
      playground = Playground.new(size, seed)
      playground_snapshots << Marshal.dump(playground)

      iterations.times do
        Rules::UnderPopulationRule.use(playground)
        Rules::OverPopulationRule.use(playground)
        Rules::BornRule.use(playground)
        playground = NextIteration.save(playground)
        playground_snapshots << Marshal.dump(playground)
      end

      playground_snapshots
    end
  end
end
