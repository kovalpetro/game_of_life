class MatrixRepresentation
  attr_reader :arr, :elem_in_arr

  def initialize(arr, size)
    @arr = arr
    @elem_in_arr = size
  end

  def prepare
    build.each_slice(elem_in_arr).to_a
  end

  private

  def build
    [].tap do |output_array|
      arr.each do |cell|
        cell.alive ? output_array << "0" : output_array << "."
      end
      output_array
    end
  end
end
