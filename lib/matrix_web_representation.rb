class MatrixWebRepresentation < MatrixRepresentation
  def build
    [].tap do |output_array|
      arr.each do |cell|
        cell.alive ? output_array << [0, 0, 0] : output_array << [255, 255, 255]
      end
      output_array
    end
  end
end
