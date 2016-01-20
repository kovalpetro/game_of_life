class BornRule
  def self.use(playground)
    playground.cells.each do |cell|
      cell.born if [3].include?(playground.neighbors_of(cell).count(&:alive))
    end
  end
end
