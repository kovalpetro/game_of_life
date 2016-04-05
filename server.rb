Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each { |file| require file }
require "socket"
require "json"

class Server
  def initialize(ip = "localhost", port = 10000)
    @server = TCPServer.open(ip ,port)
  end

  def run
    loop do
      Thread.start(@server.accept) do |client|
        data = JSON.parse(client.gets.chomp)
        process_data(data, client)
        client.close
        puts "#{client} => Connection closed!"
      end
    end
  end

  private

  def process_data(data, client)
    game = Core::LifeCycle.new(data["seed"], data["size"], data["iter"])

    game.start do |snapshot|
      output = {}
      output["console_out"] = Support::Convertors::Console.convert(snapshot.cells, game.size)
      client.puts(output.to_json)
      puts "#{client} => Snapshot sended!"
    end
  end
end

Server.new.run
