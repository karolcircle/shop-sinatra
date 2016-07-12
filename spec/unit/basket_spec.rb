require_relative '../../lib/basket.rb'
require_relative '../../lib/product.rb'
require_relative '../../lib/store.rb'

RSpec.describe Basket do
  let(:price) { 12.11 }
  let(:name) { "Ball" }
  let(:quantity) { 1 }
  let(:id) { 1 }
  let(:products) { [product] }
  let(:product) { Product.new(name, price, quantity)}
  let(:basket) { Basket.new }
  let(:store) { Store.new(1, 1) }

  it "basket is established" do
    expect {Basket.new}.to_not raise_error
  end

    it "add basket is working" do

  expect{basket.add(products, id, store, quantity)}.to_not raise_error
  end

  context "#add_product" do
    it "should check if warehouse has a product" do
      expect(basket.add(products, id, [store], quantity)).to eq(1)
    end
    it "should add product to basket" do
      expect(basket.add(products, id, [store], quantity)).to eq(1)
    end
    it "should return nil if warehouse doesn\'t have a product" do
      expect(basket.add_product(products, product.id, [warehouse_empty], quantity)).to eq(nil)
    end
  end

  it "delete product from basket" do
  product = Product.new(name, price, quantity)
  basket = Basket.new
  store = Store.new(id,1)
  basket.add(products, id, store, quantity)
  expect{basket.delete(name)}.to_not raise_error
  end

end
