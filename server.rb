Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "socket"

class Server
  def initialize(port)
    @server = TCPServer.open(port)
  end

  def run
    loop{
      Thread.start(@server.accept) do |client|
        data = eval client.gets.chomp

        process_data(data, client)
      end
    }
  end

  private

  def process_data(data, client)
    cycles = Core::LifeCycle.new(data[:seed],data[:size], data[:iter], true)

    cycles.start do |snapshot|
      output = {}
      output[:array] = Support::Convertors::Console.convert(snapshot.cells, cycles.size)
      client.puts(output)
      puts "#{client} => Snapshot sended!"
    end
  end
end

Server.new(10000).run
