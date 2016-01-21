class BornRule
  def self.use(playground)
    playground.cells.each do |cell|
      cell.born if playground.neighbors_of(cell).count(&:alive) == 3
    end
    playground
  end
end
