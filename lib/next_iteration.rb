class NextIteration
  def self.save(playground)
    playground.cells.each { |cell| cell.apply_state }
    playground
  end
end
