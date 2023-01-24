require 'restaurant_menu'

describe RestaurantMenu do
  it 'returns an empty array when no dish is added' do
    chinese_menu = RestaurantMenu.new
    expect(chinese_menu.show_menu).to eq []
  end

  it 'adds dishes to the menu and returns a list' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    chinese_menu.add_dish('Fried Rice',10)
    expect(chinese_menu.show_menu).to eq [{"Dim Sum"=>5},{"Fried Rice"=>10}]
  end
end
