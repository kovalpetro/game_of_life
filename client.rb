Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "socket"
require "tty"
require "byebug"

class Client
  def initialize(server)
    @server = server
    send
    listen
  end

  def send
    Thread.new do
      attributes = {}
      puts "Enter number of iterations"
      attributes[:iter] = gets.chomp.to_i

      puts "Enter path to example csv file"
      path = gets.chomp

      seed_data = Support::CsvLoader.new(path)
      attributes[:seed] = seed_data.load
      attributes[:size] = @size = seed_data.size

      @server.puts(attributes)
    end
  end

  def listen
    Thread.new do
      loop {
        snapshot = eval(@server.gets.chomp)[:array]
        table = TTY::Table[*snapshot]
        puts `clear`
        puts table.to_s
      }
    end
  end
end

server = TCPSocket.open("localhost", 10000)
Client.new(server)

