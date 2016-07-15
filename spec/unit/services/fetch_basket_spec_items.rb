require_relative "../../../lib/services/fetch_basket_items"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"

module Shop
  BASKET = []
  PRODUCTS = []

  RSpec.describe Shop::FetchBasket do
    let(:product) { Shop::Product.new("Ball", 12) }
    let(:price) { 12 }
    let(:quantity) { 1 }
    let(:product_id) { 1 }
    let(:total_price) { price * quantity }
    let(:total_price_gross) { total_price * 1.23 } 
    let(:result) { [
      product: product,
      quantity: quantity,
      product_id: product_id,
      total_price: total_price,
      total_price_gross: total_price_gross
      ] }

    let(:add_product_to_basket) { Shop::Basket.new(product_id: product.id, quantity: quantity) }

    subject(:fetch_basket) { Shop::FetchBasketItems.new }

    before do
      Shop::BASKET.clear
      Shop::PRODUCTS << product
      Shop::BASKET << add_product_to_basket
    end

    describe "#call" do
      it 'returns product in basket' do
        expect(fetch_basket.call).to eq(result)
      end
    end
  end
end