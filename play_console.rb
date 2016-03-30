Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }

# Input data
iter = ARGV.first.chomp.to_i          #Number of iterations
path = ARGV.last.chomp                #Path to csv file
seed_data = Support::CsvLoader.new(path)

# Core processing
game = Core::LifeCycle.new(seed_data.load, seed_data.size, iter)

# Console output
OutputStrategy::ConsoleOut.generate(game.start, game.size)
