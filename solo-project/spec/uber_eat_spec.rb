require 'uber_eat'

describe UberEat do
  it 'gets no available dishes from the empty menu' do
    chinese_menu = double :menu, show_menu:[]
    uber_eat = UberEat.new(chinese_menu)
    expect(uber_eat.show_dishes).to eq []
  end

  it 'gets all available dishes from the menu' do
    chinese_menu = double :menu, show_menu:[{name:'Dim Sum',price:5},{name:'Fried Rice',price:10}]
    uber_eat = UberEat.new(chinese_menu)
    expect(uber_eat.show_dishes).to eq [{name:'Dim Sum',price:5},{name:'Fried Rice',price:10}]
  end

  it 'adds two dim sum to the cart and returns a list' do
    chinese_menu = double :menu, show_menu:[{name:'Dim Sum',price:5}]
    uber_eat = UberEat.new(chinese_menu)
    uber_eat.add_to_cart('Dim Sum',2)
    expect(uber_eat.show_cart).to eq "Dim Sum => 2\nTotal: $10"
  end

  it 'raises an error if the added item is not on the menu' do
    chinese_menu = double :menu, show_menu:[]
    uber_eat = UberEat.new(chinese_menu)
    expect {uber_eat.add_to_cart('Dim Sum',2)}.to raise_error 'Ops, this dish is not available!'
  end

  it 'removes dish and the input amount from the cart' do
    chinese_menu = double :menu, show_menu:[{name:'Dim Sum',price:5}]
    uber_eat = UberEat.new(chinese_menu)
    uber_eat.add_to_cart('Dim Sum',2)
    expect(uber_eat.show_cart).to eq "Dim Sum => 2\nTotal: $10"
    uber_eat.remove_from_cart('Dim Sum',1)
    expect(uber_eat.show_cart).to eq "Dim Sum => 1\nTotal: $5"
  end
end
