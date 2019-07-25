require "test_helper"

describe ItemPrice do
  let(:item_price) { ItemPrice.new }

  it "must be valid" do
    value(item_price).must_be :valid?
  end
end
