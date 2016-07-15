module Shop
  class Basket
    attr_reader :product_id, :id
    attr_accessor :quantity

    @@id = 0 

    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = set_quantity(quantity)
      @id = set_id
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
    
    def set_id
      @@id += 1
    end

    def set_quantity(quantity)
      raise ArgumentError unless quantity.is_a?(Numeric)
      raise ArgumentError if quantity <= 0
      quantity
    end
  end
end
