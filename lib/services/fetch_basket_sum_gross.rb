module Shop
  class FetchBasketSumGross
    def call
     basket_sum_gross = FetchBasketItems.new.call.map { |basket_item|  basket_item[:total_price_gross] }.reduce(:+)
    end
  end
end
