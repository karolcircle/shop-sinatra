require_relative '../../../lib/model/product.rb'

module Shop
  RSpec.describe Shop::Product do
    let(:price) { 12 }
    let(:name) { "Ball" }
    let(:quantity) { 1 }

    subject(:product) { Product.new("Ball", 12) }

    it "has 2 params" do
      expect {Product.new(name, price)}.to_not raise_error(ArgumentError)
    end

    context "#name" do
      it "returns proper value" do
        expect(product.name).to eq(name)
      end
    end

    context "#price" do
      it "return proper value" do
        expect(Product.new(name, price).price).to eq(price)
      end

      it "raises error for non numeric price" do
        expect{Product.new(name, nil).price}.to raise_error(ArgumentError)
      end
    end
  end
end
