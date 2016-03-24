Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"

get "/" do
  erb :form
end

post "/" do
  WebGenerateGif.new(
    CsvLoader.load(params[:seed]),
    params[:size],
    params[:iterations]
  ).generate

  erb :representation
end

