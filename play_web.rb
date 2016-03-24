Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"

get "/" do
  erb :form
end

post "/" do
  data = CsvLoader.new(params[:seed])

  WebGenerateGif.new(
    data.load,
    data.size,
    params[:iterations]
  ).generate

  erb :representation
end
