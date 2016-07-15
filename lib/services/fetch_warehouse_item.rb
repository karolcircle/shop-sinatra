module Shop
  class FetchWarehouseItem
    def call(product_id)
      WAREHOUSE.find { |item| item.product_id == product_id }  
    end
  end
end