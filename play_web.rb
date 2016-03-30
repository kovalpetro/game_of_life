Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"

get "/" do
  erb :form
end

post "/" do
  # Input data
  seed_data = Support::CsvLoader.new("examples/" + params[:seed])
  iter = params[:iterations].to_i

  # Core processing
  game = Core::LifeCycle.new(seed_data.load, seed_data.size, iter)

  # Web output
  OutputStrategy::WebOut.generate(game.start, game.size)
  erb :representation
end
