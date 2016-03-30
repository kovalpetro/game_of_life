require_relative "game_of_life_client/client"

client = GameOfLifeClient::Client.new
client.send
client.listen
