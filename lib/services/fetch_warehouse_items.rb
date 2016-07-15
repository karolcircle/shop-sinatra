module Shop
  class FetchWarehouseItems
    def call
      WAREHOUSE.map do |item|
      {
        product: item.fetch_product,
        product_id: item.product_id,
        product_id: item.product_id,
        quantity: item.quantity,        
      }
      end
    end
  end
end