require "rmagick"

module OutputStrategy
  module WebOut
    def self.generate(snapshots, size)
      snapshots.map.with_index do |pg, index|
        web_out_array = Support::Convertors::Web.convert(Marshal.load(pg).cells, size)

        img = Magick::Image.new(size, size)

        web_out_array.each_with_index do |row, row_index|
          row.each_with_index do |item, column_index|
            img.pixel_color(row_index, column_index, "rgb(#{item.join(', ')})")
          end
        end

        img.write("#{index}.png")
      end

      generated_files = Dir["*.png"]
      result = Magick::ImageList.new(*generated_files)
      result.delay = 40
      result.write("public/result.gif")
      File.delete(*generated_files)
    end
  end
end
