class LifeCycle
  attr_reader :seed, :size, :iterations

  def initialize(seed, size, iterations)
    @seed = seed
    @size = size
    @iterations = iterations
  end

  def start
    [].tap do |playground_snapshots|
      playground = Core::Playground.new(size, seed)
      playground_snapshots << Marshal.dump(playground)

      iterations.times do
        Core::Rules::UnderPopulationRule.use(playground)
        Core::Rules::OverPopulationRule.use(playground)
        Core::Rules::BornRule.use(playground)
        playground = Core::NextIteration.save(playground)
        playground_snapshots << Marshal.dump(playground)
      end

      playground_snapshots
    end
  end
end
