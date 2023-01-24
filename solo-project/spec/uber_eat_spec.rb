require 'uber_eat'

describe UberEat do
  it 'gets no available dishes from the empty menu' do
    chinese_menu = double :menu, show_menu:[]
  uber_eat = UberEat.new(chinese_menu)
  expect(uber_eat.show_dishes).to eq []
  end
end
