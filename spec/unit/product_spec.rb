require_relative '../../lib/product.rb'

RSpec.describe Product do
  let(:price) { 12.11 }
  let(:name) { "Ball" }
  let(:quantity) { 1 }
  it "has 3 params" do
    expect {Product.new(name, price, quantity)}.to_not raise_error
  end

  it "raises error for invalid number of args" do
    expect {Product.new(name, price)
    }.to raise_error(ArgumentError)
  end


  context "#name" do
    it "return proper value" do
    expect(Product.new(name, price, quantity).name).to eq(name)
    end
  end

  context "#price" do
    it "return proper value" do
    expect(Product.new(name, price, quantity).price).to eq(price)
    end
    it "raises error for non numeric price" do
      expect{Product.new(name, nil, quantity).price}.to raise_error(ArgumentError)
    end
  end

  context "#quantity" do
    it "return proper value" do
    expect(Product.new(name, price, quantity).quantity).to eq(quantity)
    end
  end


end
