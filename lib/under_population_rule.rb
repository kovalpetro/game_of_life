class UnderPopulationRule
  def self.use(playground)
    playground.cells.each do |cell|
      cell.die if playground.neighbors_of(cell).count(&:alive) < 2
    end
    playground
  end
end
