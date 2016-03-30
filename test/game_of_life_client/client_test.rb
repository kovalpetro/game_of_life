require "./game_of_life_client/client"
require "socket"

describe "Client" do
  before do
    @client = GameOfLifeClient::Client.new
  end

  let(:iterations) { 5 }
  let(:path)       { "examples/beacon_period_2.csv" }
  let(:seed)       { [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]] }
  let(:size)       { 20 }

  it "attributes should be a hash" do
    @client.set_data(iterations, path).must_be_kind_of Hash
  end

  it "should set attributes" do
    data = @client.set_data(iterations, path)
    data["iter"].must_equal iterations
    data["seed"].must_equal seed
    data["size"].must_equal size
  end
end
