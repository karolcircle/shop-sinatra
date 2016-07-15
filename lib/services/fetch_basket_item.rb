module Shop
  class FetchBasketItem
    def call(product_id)
      BASKET.find { |item| item.product_id == product_id }  
    end
  end
end
