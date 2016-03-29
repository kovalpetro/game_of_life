require "./game_of_life_client/client"
require "socket"

describe "Client" do
  before do
    server = TCPSocket.open("localhost", 10000)
    @client = GameOfLifeClient::Client.new(server)
  end

  let(:iterations) { 5 }
  let(:path)       { "examples/beacon_period_2.csv" }
  let(:seed)       { [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]] }
  let(:size)       { 20 }

  it "attributes should be a hash" do
    @client.attributes.must_be_kind_of Hash
  end

  it "attributes should be empty after initialization" do
    @client.attributes.must_be_empty
  end

  it "should set attributes" do
    @client.set_data(iterations, path)
    @client.attributes[:iter].must_equal iterations
    @client.attributes[:seed].must_equal seed
    @client.attributes[:size].must_equal size
  end
end
