class RestaurantMenu
  def initialize
    @menu_list = []
  end

  def add_dish(name,price)
    @menu_list << {name:name,price:price}
  end

  def remove_dish(name)
    @menu_list = @menu_list.select {|item| item[:name] != name}
    return @menu_list
  end

  def show_menu
    @menu_list
  end
end
