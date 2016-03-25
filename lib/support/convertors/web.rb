module Support
  module Convertors
    module Web
      def self.convert(array, elem_in_arr)
        [].tap do |output_array|
          array.each do |cell|
            cell.alive ? output_array << [0, 0, 0] : output_array << [255, 255, 255]
          end
          output_array
        end.each_slice(elem_in_arr).to_a
      end
    end
  end
end
