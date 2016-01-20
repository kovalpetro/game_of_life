class DeathRule
  def self.use(playground)
    playground.cells.each do |cell|
      cell.die unless [2, 3].include?(playground.neighbors_of(cell).count(&:alive))
    end
  end
end
