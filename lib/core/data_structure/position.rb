module Core
  module DataStructure
    class Position
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end
    end
  end
end
