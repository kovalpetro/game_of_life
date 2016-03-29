require_relative "game_of_life_client/client"

client = GameOfLifeClient::Client.new(TCPSocket.open("localhost", 10000))
client.send
client.listen
