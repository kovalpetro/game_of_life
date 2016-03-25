require "rmagick"

class WebGenerateGif
  attr_reader :seed, :size, :iterations

  def initialize(seed, size, iterations)
    @seed = seed
    @size = size
    @iterations = iterations.to_i
  end

  def generate
    write_files_from_snapshots
    generated_files = Dir["*.png"]

    result = Magick::ImageList.new(*generated_files)
    result.delay = 20
    result.write("public/result.gif")
    File.delete(*generated_files)
  end

  def write_files_from_snapshots
    LifeCycle.new(seed, size, iterations).start.map.with_index do |elem, index|
      data = ::MatrixWebRepresentation.new(Marshal.load(elem).cells, size).prepare

      img = Magick::Image.new(size, size)

      data.each_with_index do |row, row_index|
        row.each_with_index do |item, column_index|
          img.pixel_color(row_index, column_index, "rgb(#{item.join(', ')})")
        end
      end

      img.write("#{index}.png")
    end
  end
end

