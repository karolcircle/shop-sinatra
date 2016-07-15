module Shop
  class MyError < StandardError
    def message
      "Quantity may not be lower then 0."
    end
  end
end
