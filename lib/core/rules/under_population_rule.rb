module Core
  module Rules
    class UnderPopulationRule
      def self.use(playground)
        playground.cells.each do |cell|
          cell.die if playground.neighbors_of(cell).count(&:alive) < 2
        end
      end
    end
  end
end
