class Store
attr_accessor :store_quantity
attr_reader :product_id


	def initialize(product_id, store_quantity)
    @product_id = product_id
    @store_quantity = store_quantity
  end
end
