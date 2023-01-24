class UberEat
  def initialize(menu)
    @menu = menu # [{name:'Dim Sum',price:5},...]
    @cart = [] # [{dish:'Dim Sum',quantity:2},...]
  end

  def show_dishes
    @menu.show_menu
  end

  def add_to_cart(dish,quantity)
    @menu.show_menu.each do |item|
      if item[:name] == dish 
        @cart << {dish:dish,quantity:quantity} 
        return
      end
    end
    fail 'Ops, this dish is not available!' 
  end

  def remove_from_cart(dish,quantity)
    @cart.each do |item|
      if item[:dish] == dish
        item[:quantity] -= quantity
      end
    end
    @cart = @cart.select {|item| item[:quantity] > 0}
  end


  def show_cart
    dish_list = ""
    @cart.each do |item| 
      dish_list += "#{item[:dish]} => #{item[:quantity]}\n"
    end
    return "#{dish_list}Total: $#{total_cost()}"
  end

  private

  def total_cost
    total = 0
    @cart.each do |item|
      @menu.show_menu.each do |dish|
        if item[:dish] == dish[:name]
          total += (dish[:price] * item[:quantity])
        end
      end
    end
    return total 
  end
end
