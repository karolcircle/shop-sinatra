module Shop
  class Warehouse
    attr_reader :product_id, :id
    attr_accessor :quantity

    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = check_quantity(quantity)
    end  

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    private

    def check_quantity(quantity)
      raise ArgumentError unless quantity.is_a?(Numeric)
      raise ArgumentError if quantity <= 0
      quantity
    end
  end
end
