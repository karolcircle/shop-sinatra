module Shop
  class FetchBasketSumNet
    def call
      basket_sum = FetchBasketItems.new.call.map { |basket_item|  basket_item[:total_price_net] }.reduce(:+)
    end
  end
end
