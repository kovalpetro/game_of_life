require_relative "./test_helper"

describe "Playground" do

  it "#new" do
    size = [3, 3]
    pg = Playground.new(size)
    pg.height.must_equal size[1]
    pg.width.must_equal size[0]
  end
end
