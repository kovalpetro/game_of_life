Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "socket"
require "byebug"

class Server
  def initialize(port)
    @server = TCPServer.open(port)
    run
  end

  def run
    loop{
      client = @server.accept
      data = eval client.gets.chomp
      cycles = Core::LifeCycle.new(data[:seed],data[:size], data[:iter])
      cycles.start do |snapshot|
        output = {}
        output[:array] = Support::Convertors::Console.convert(snapshot.cells, cycles.size)
        client.puts(output)
        puts "Snapshot sended!"
      end
    }
  end
end

Server.new(10000)
