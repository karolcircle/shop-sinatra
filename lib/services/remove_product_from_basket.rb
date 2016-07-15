module Shop
  class RemoveProductFromBasket
    attr_accessor :quantity
    attr_reader :product_id

    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      item = FetchBasketItem.new.call(product_id)
      return unless item
      reduce_item_quantity(item, quantity)
    end

    private
    def reduce_item_quantity(item, quantity)
      if item.quantity > quantity
        item.quantity -= quantity 
      elsif item.quantity == quantity
        BASKET.delete(item)
      else
        raise MyError
      end      
    end    
  end
end
