require_relative "./basket.rb"
require_relative "./store.rb"
require_relative "./product.rb"

products = [
  Product.new("Ball", 112, 1),
  Product.new("Car", 212, 1),
  Product.new("Plane", 412, 1),
 ]


store = [
  Store.new(1, 10),
  Store.new(2, 15),
  Store.new(3, 20),
  ]
basket = Basket.new
basket.add(products, 1, store, 1)
basket.add(products, 2, store, 1)
basket.add(products, 2, store, 6)
basket.add(products, 3, store, 1)
basket.delete("Ball")
basket.total
