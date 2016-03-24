module Core
  class NextIteration
    def self.save(playground)
      playground.cells.each(&:apply_state)
      playground
    end
  end
end
