class Product
attr_reader :name, :price, :id
attr_accessor :quantity
  @@id = 0

  def initialize(name, price, quantity)
    @id = next_id
    @name = name
    @price = set_price(price)
    @quantity = quantity
  end

private

  def next_id
    @@id +=1
  end

  def set_price(price)
    raise ArgumentError unless price.is_a?(Numeric)
    raise ArgumentError if price <= 0
    price
  end

end
