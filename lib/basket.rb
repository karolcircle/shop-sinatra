class Basket
attr_accessor :products, :items

  def initialize
    @products = Array.new
  end

  def add(products, id, store, quantity)
    find_product_in_store = find_store(store, id)
    find_product = find_product(products, id)
      if find_product_in_store.store_quantity > 0
  	     find_product.quantity = quantity
  	      if @products.include?(find_product)
            find_product.quantity+=quantity
          else
            @products << find_product
          end
          find_product_in_store.store_quantity -= quantity
        else
          puts "Not added"
      end
  end

  def find_product(products, id)
    products.find { |product| product.id == id }
  end

  def find_store(store, id)
    store.find { |store| store.product_id == id }
  end


  def current
    products.each do |x|
      puts "Name: #{x.name}, item price: #{x.price}, total price: #{x.price*x.quantity}, quantity: #{x.quantity} items"
    end
  end

  def delete(name)
    @products.delete(@products.find { |x| x.name == name })
  end

  def decrease_quantity(name)
    find_product = products.find { |x| x.name == name }
    find_product.quantity-=1
  end


  def total
    @total_rows = []
      products.each do |x|
        total_rows = x.price * x.quantity
        @total_rows << total_rows
      end
    total = @total_rows.inject(0){|sum,x| sum + x }
    current
    puts "Sum net #{(total).round(2)}"
    puts "Sum gross #{(total *1.23).round(2)}"
  end



end
