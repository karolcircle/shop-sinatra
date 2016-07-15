require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"
require_relative "../../../lib/services/fetch_basket_items"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/add_product_to_basket"

module Shop
  BASKET = []
  PRODUCTS = []

  RSpec.describe Shop::AddProductToBasket do
    let(:product) { Shop::Product.new("Ball", 12) }
    let(:price) { 12 }
    let(:quantity) { 1 }
    let(:product_id) { 1 }
    let(:total_price) { price * quantity }
    let(:params) { { "product_id" =>  product_id, "quantity" => quantity } }
    let(:add_product_to_basket) { Shop::Basket.new(product_id: product.id, quantity: quantity) }
    
    subject(:add_to_basket) { Shop::AddProductToBasket.new(params) }

    before do
      Shop::BASKET.clear
      Shop::PRODUCTS << product
      Shop::BASKET << add_product_to_basket
    end

    describe "#call" do
      it 'added product to basket' do
        expect(add_to_basket.call).to eq(Shop::BASKET)
      end
    end
  end
end