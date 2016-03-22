Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"
require "byebug"

get "/" do
  erb :form
end

post "/" do
  life_cycle = LifeCycle.new(CsvLoader.load(params[:seed]), params[:size].to_i, params[:iterations].to_i)
  array = life_cycle.start.map do |elem|
    MatrixRepresentation.new(Marshal.load(elem).cells, params[:size].to_i).prepare
  end
  "Data: size => #{life_cycle.size}, iterations => #{life_cycle.iterations}, seed => #{life_cycle.seed}"
  "#{array}"
end
