class ArrayCreator
  attr_reader :arr, :elem_in_arr

  def initialize(arr, size)
    @arr = arr
    @elem_in_arr = size[0]

  end

  def splitter
    build.each_slice(elem_in_arr).to_a
  end

  private

  def build
    [].tap do |output_array|
      arr.each do |cell|
        cell.alive ? output_array << 1 : output_array << 0
      end
    end
  end
end
