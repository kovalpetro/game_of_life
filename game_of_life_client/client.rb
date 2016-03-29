require "./lib/support/csv_loader"
require "socket"
require "tty"

module GameOfLifeClient
  class Client
    attr_reader :attributes

    def initialize(server)
      @server = server
      @attributes = {}
    end

    def send
      collect_data
      @server.puts(attributes)
    end

    def listen
      loop {
        snapshot = eval(@server.gets.chomp)[:array]
        print_result snapshot
      }
    end

    def set_data(iterations, path)
      seed_data = Support::CsvLoader.new(path)
      @attributes[:seed] = seed_data.load
      @attributes[:size] = seed_data.size
      @attributes[:iter] = iterations
    end

    private

    def print_result(snapshot)
      table = TTY::Table[*snapshot]
      puts `clear`
      puts table.to_s
    end

    def collect_data
      puts "Enter number of iterations"
      iterations = get_value.to_i

      puts "Enter path to example csv file"
      path = get_value

      set_data(iterations, path)
    end

    def get_value
      gets.chomp
    end
  end
end
