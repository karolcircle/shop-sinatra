require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each{ |file| require file }

module Shop
  PRODUCTS = [
    Product.new('Onion', 120),
    Product.new('Potato', 200),
    Product.new('Carrot', 400),
  ]

  WAREHOUSE = [ 
    Warehouse.new(product_id: 1, quantity: 100),
    Warehouse.new(product_id: 2, quantity: 100),
    Warehouse.new(product_id: 3, quantity: 100)
  ]

  BASKET = []

  class App < Sinatra::Base
    configure :test do
      set :dump_errors, false
      set :method_override, true
    end

    get "/" do
      products_in_warehouse = FetchWarehouseItems.new.call
      erb :"products/index", locals: { warehouse: products_in_warehouse }       
    end

    get "/products/:id" do |id|
      product = FetchProduct.new.call(id)
      halt 404 unless product
      erb :"products/show", locals: { product: product }
    end

    get "/basket" do
      products_in_basket = FetchBasketItems.new.call
      net_sum = FetchBasketSumNet.new.call
      gross_sum = FetchBasketSumGross.new.call
      erb :"basket/show", locals: { basket: products_in_basket, net_sum: net_sum, gross_sum: gross_sum }
    end
    
    post "/basket" do
      begin
        AddProductToBasket.new(params).call
        RemoveProductFromWarehouse.new(params).call
        redirect "/basket"
      rescue KeyError
        halt 422
      end
    end

    delete "/basket" do
      RemoveProductFromBasket.new(params).call
      redirect "/basket"
    end    
  end
end
