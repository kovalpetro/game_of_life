require "./lib/support/csv_loader"
require "socket"
require "tty"
require "json"

module GameOfLifeClient
  class Client
    def initialize(host = "localhost", port = 10000)
      @socket = TCPSocket.open(host, port)
    end

    def send
      @socket.puts(collect_data.to_json)
    end

    def listen
      while snapshot = @socket.gets do
        print_result JSON.parse(snapshot.chomp).fetch("console_out")
      end
    end

    def set_data(iterations, path)
      attributes = {}
      seed_data = Support::CsvLoader.new(path)
      attributes["seed"] = seed_data.load
      attributes["size"] = seed_data.size
      attributes["iter"] = iterations
      attributes
    end

    private

    def print_result(snapshot)
      table = TTY::Table[*snapshot]
      puts `clear`
      puts table.to_s
    end

    def collect_data
      puts "Enter number of iterations"
      iterations = gets.chomp.to_i

      puts "Enter path to example csv file"
      path = gets.chomp

      set_data(iterations, path)
    end
  end
end
