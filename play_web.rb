Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "sinatra"
require "byebug"

get "/" do
  erb :form
end

post "/" do
  life_cycle = LifeCycle.new(CsvLoader.load(params[:seed]), params[:size].to_i, params[:iterations].to_i)
  @array = life_cycle.start.map do |elem|
    MatrixRepresentation.new(Marshal.load(elem).cells, params[:size].to_i).prepare
  end

  erb :representation
end


# @array.each {|playground| playground.each { |row| row each { |element| "!!! #{element} !!!" } } }
