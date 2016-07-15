module Shop
  class Product
    attr_reader :id, :name, :price

    @@id = 0

    def initialize(name, price)
      @id = set_id
      @name = name
      @price = set_price(price)
    end

    private
    def set_id
      @@id += 1
    end

    def set_price(price)
      raise ArgumentError unless price.is_a?(Numeric)
      raise ArgumentError if price <= 0
      price
    end
  end
end
