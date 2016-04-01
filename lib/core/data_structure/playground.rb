module Core
  module DataStructure
    class Playground
      attr_reader :width, :height, :cells

      def initialize(size, seed = [])
        @width = @height = size
        @cells = fill_in(seed)
      end

      def neighbors_of(main_cell)
        @cells.select do |cell|
          ((cell.x - main_cell.x).abs == 1 && cell.y == main_cell.y) ||
            ((cell.y - main_cell.y).abs == 1 && cell.x == main_cell.x) ||
            ((cell.x - main_cell.x).abs == 1 && (cell.y - main_cell.y).abs == 1)
        end
      end

      private

      def fill_in(seed)
        [].tap do |cells|
          1.upto(width) do |y|
            1.upto(height) do |x|
              pos = Position.new(x, y)
              alive = seed.include?([x, y])
              cells << Cell.new(pos, alive)
            end
          end
        end
      end
    end
  end
end
