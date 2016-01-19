class DeathRule

  def self.use(playground)
    playground.cells.each do |cell|
      cell.die unless [3, 4].include?(playground.neighbors_of(cell).count)
    end
  end
end
