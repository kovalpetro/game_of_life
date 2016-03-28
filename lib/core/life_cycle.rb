module Core
  class LifeCycle
    attr_reader :seed, :size, :iterations, :client_server

    def initialize(seed, size, iterations, client_server = false)
      @seed = seed
      @size = size
      @iterations = iterations
      @client_server = client_server
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
          yield(playground) if client_server
          playground_snapshots << Marshal.dump(playground)
        end

        playground_snapshots
      end
    end
  end
end
