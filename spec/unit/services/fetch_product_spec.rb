require_relative "../../../lib/model/product"
require_relative "../../../lib/services/fetch_product"

module Shop
  PRODUCTS = []
  RSpec.describe Shop::FetchProduct do
    let(:product) { Shop::Product.new("Ball", 12) }
    
    subject(:fetch_product) { Shop::FetchProduct.new }

    before do
      Shop::PRODUCTS.clear
      Shop::PRODUCTS << product    
    end

    describe "#call" do
      it 'returns product in basket' do
        expect(fetch_product.call(product.id)).to eq(product)
      end
    end
  end
end
