require_relative "../test_helper"

describe "CsvLoader" do
  before do
    csv_path = "examples/beacon_period_2.csv"
    @loader = Support::CsvLoader.new(csv_path)
  end

  let(:seed) { [[1, 1], [1, 2], [2, 1], [4, 4], [3, 4], [4, 3]] }
  let(:size) { 20 }

  it "should load seed from file" do
    @loader.load.must_equal seed
  end

  it "should set size" do
    @loader.load
    @loader.size.must_equal size
  end
end
