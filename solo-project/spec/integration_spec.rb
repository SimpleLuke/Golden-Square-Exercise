require 'uber_eat'
require 'restaurant_menu'

describe 'Integration' do
  it 'gets no available dishes from the empty menu' do
    chinese_menu = RestaurantMenu.new
    uber_eat = UberEat.new(chinese_menu)
    expect(uber_eat.show_dishes).to eq []
  end 

  it 'gets a list of available dishes from the menu' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    chinese_menu.add_dish('Fried Rice',10)
    uber_eat = UberEat.new(chinese_menu)
  expect(uber_eat.show_dishes).to eq [{"Dim Sum"=>5},{"Fried Rice"=>10}]
  end
end
