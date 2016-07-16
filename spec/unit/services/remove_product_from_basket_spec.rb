require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"
require_relative "../../../lib/services/fetch_basket_item"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/services/remove_product_from_basket"

module Shop
  BASKET = []
  PRODUCTS = []
  RSpec.describe Shop::RemoveProductFromBasket do
    let(:product) { Shop::Product.new("Ball", 12) }
    let(:price) { 12 }
    let(:quantity) { 1 }
    let(:product_id) { 1 }
    let(:total_price) { price * quantity }
    let(:params) { { "product_id" =>  product_id, "quantity" => quantity } }
    let(:add_product_to_basket) { Shop::Basket.new(product_id: product.id, quantity: quantity) }
    
    subject(:add_to_basket) { Shop::AddProductToBasket.new(params) }
    subject(:remove_from_basket) { Shop::RemoveProductFromBasket.new(params) }
    
    before do
      Shop::BASKET.clear
      Shop::PRODUCTS << product
      Shop::BASKET << add_product_to_basket
    end

    describe "#call" do
      it 'removed product from basket' do
        expect(remove_from_basket.call).to eq(nil)
      end
    end
  end
end
