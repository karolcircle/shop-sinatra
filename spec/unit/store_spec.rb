require_relative '../../lib/store.rb'

RSpec.describe Store do
  let(:product_id) { 1 }
  let(:store_quantity) { 1 }

  it "has 2 params" do
    expect {Store.new(product_id, store_quantity)}.to_not raise_error
  end
end
