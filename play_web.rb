Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"
require "byebug"
require "rmagick"

get "/" do
  erb :form
end

post "/" do
  life_cycle = LifeCycle.new(CsvLoader.load(params[:seed]), params[:size].to_i, params[:iterations].to_i)
  # byebug
  life_cycle.start.map.with_index do |elem, index|
    data = MatrixWebRepresentation.new(Marshal.load(elem).cells, params[:size].to_i).prepare

    img = Magick::Image.new(params[:size].to_i, params[:size].to_i)

    data.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        img.pixel_color(row_index, column_index, "rgb(#{item.join(', ')})")
      end
    end

    img.write("#{index}.png")
  end

  generated_files = Dir["*.png"]

  result = Magick::ImageList.new(*generated_files)
  result.delay = 20
  result.write("public/result.gif")
  File.delete(*generated_files)

  erb :representation
end

