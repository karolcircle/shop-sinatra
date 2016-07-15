require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"

module Shop
  RSpec.describe Shop::Basket do
    let(:product_id) { 1 }
    let(:quantity) { 2 }
    let(:result) { quantity * price}

    subject(:basket) { Basket.new(product_id: product_id, quantity: quantity) }

    it "has 2 params" do
      expect { Basket.new(product_id: product_id, quantity: quantity) }.to_not raise_error(ArgumentError)
    end

    context "#product_id" do
      it "returns proper value" do
        expect(basket.product_id).to eq(product_id)
      end
    end

    context "#quantity" do
      it "return proper value" do
        expect(basket.quantity).to eq(quantity)
      end

      it "raises error for non numeric quantity" do
        expect { Basket.new(product_id: product_id, quantity: "nil").quantity }.to raise_error(ArgumentError)
      end
    end
  end
end
