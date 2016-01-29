module Rules
  class OverPopulationRule
    def self.use(playground)
      playground.cells.each do |cell|
        cell.die if playground.neighbors_of(cell).count(&:alive) > 3
      end
    end
  end
end
