class RestaurantMenu
  def initialize
    @menu_list = []
  end

  def add_dish(name,price)
    @menu_list << {name => price}
  end

  def show_menu
    @menu_list
  end
end
