module Support
  module Convertors
    module Console
      def self.convert(array, elem_in_arr)
        [].tap do |output_array|
          array.each do |cell|
            cell.alive ? output_array << "0" : output_array << "."
          end
          output_array
        end.each_slice(elem_in_arr).to_a
      end
    end
  end
end
