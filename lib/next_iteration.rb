class NextIteration
  def self.save(playground)
    playground.cells.each do |cell|
      cell.apply_state
    end
    playground
  end
end
