Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"

get "/" do
  erb :form
end

post "/" do
  # Input data
  seed_data = Support::CsvLoader.new("examples/" + params[:seed])

  # Core processing
  cycles = Core::LifeCycle.new(seed_data.load, seed_data.size, params[:iterations].to_i)

  # Web output
  OutputStrategy::WebOut.generate(cycles.start, cycles.size)
  erb :representation
end
