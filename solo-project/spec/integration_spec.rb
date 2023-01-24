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
    expect(uber_eat.show_dishes).to eq [{name:'Dim Sum',price:5},{name:'Fried Rice',price:10}]
  end

  it 'gets an updated list of available dishes after dish is removed from menu' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    chinese_menu.add_dish('Fried Rice',10)
    uber_eat = UberEat.new(chinese_menu)
    chinese_menu.remove_dish('Fried Rice')
    expect(uber_eat.show_dishes).to eq [{name:'Dim Sum',price:5}]
  end

  it 'adds two dim sum to the cart and returns a list' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    uber_eat = UberEat.new(chinese_menu)
    uber_eat.add_to_cart('Dim Sum',2)
    expect(uber_eat.show_cart).to eq "Dim Sum => 2\nTotal: $10"
  end

end
