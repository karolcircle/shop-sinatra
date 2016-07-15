require_relative "../../../lib/model/product"
require_relative "../../../lib/services/fetch_products"

module Shop
  PRODUCTS = []
  RSpec.describe Shop::FetchProducts do
    let(:product1) { Shop::Product.new("Ball", 12) }
    let(:product2) { Shop::Product.new("Plane", 120) }

    subject(:fetch_products) { Shop::FetchProducts.new }

    before do
      Shop::PRODUCTS.clear
      Shop::PRODUCTS << product1
      Shop::PRODUCTS << product2
    end

    describe "#call" do
      it 'returns products in baskets' do
        expect(fetch_products.call).to eq(Shop::PRODUCTS)
      end
    end
  end
end
