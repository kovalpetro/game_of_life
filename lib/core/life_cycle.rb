module Core
  class LifeCycle
    attr_reader :seed, :size, :iterations, :client_strategy

    def initialize(seed, size, iterations, client_strategy = false)
      @seed = seed
      @size = size
      @iterations = iterations
      @client_strategy = client_strategy
    end

    def start
      [].tap do |playground_snapshots|
        playground = Core::Playground.new(size, seed)

        iterations.times do
          playground = cycle(playground)
          playground_snapshots << Marshal.dump(playground)
          yield(playground) if client_strategy
        end

        playground_snapshots
      end
    end

    private

    def cycle(playground)
      Core::Rules::UnderPopulationRule.use(playground)
      Core::Rules::OverPopulationRule.use(playground)
      Core::Rules::BornRule.use(playground)
      Core::NextIteration.save(playground)
    end
  end
end
