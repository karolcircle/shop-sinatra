module Shop
  class FetchBasketItems
    def call
      BASKET.map do |item|
      {
      product: item.fetch_product,
      product_id: item.product_id,
      quantity: item.quantity,
      total_price_net: item.total_price_net,
      total_price_gross: item.total_price_gross,
      }
      end
    end    
  end
end
