module Shop
  class Basket
    attr_reader :product_id, :id
    attr_accessor :quantity

    @@id = 0 

    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = check_quantity(quantity)
      @id = build_id
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    def total_price_net
      product = fetch_product
      product.price * quantity
    end

    def total_price_gross
      (total_price_net * 1.23).round(2)
    end

    private
    
    def build_id
      @@id += 1
    end

    def check_quantity(quantity)
      raise ArgumentError unless quantity.is_a?(Numeric)
      raise ArgumentError if quantity <= 0
      quantity
    end
 
    def basket_sum_gross
      basket_sum_gross = FetchBasketItems.new.call.map { |basket_item|  basket_item[:total_price_gross] }.reduce(:+)
    end 
  end
end
