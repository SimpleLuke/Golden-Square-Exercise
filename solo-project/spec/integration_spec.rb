require 'uber_eat'
require 'restaurant_menu'
require 'fake_sms'

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

  it 'adds two dim sum and three fried rice to the cart and returns a list' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    chinese_menu.add_dish('Fried Rice',10)
    uber_eat = UberEat.new(chinese_menu)
    uber_eat.add_to_cart('Dim Sum',2)
    uber_eat.add_to_cart('Fried Rice',3)
    expect(uber_eat.show_cart).to eq "Dim Sum => 2\nFried Rice => 3\nTotal: $40"
  end

  it 'raises an error if the added dish is not on the menu' do
    chinese_menu = RestaurantMenu.new
    uber_eat = UberEat.new(chinese_menu)
    expect {uber_eat.add_to_cart('Dim Sum',2)}.to raise_error 'Ops, this dish is not available!'
  end

  it 'removes dish and the input amount from the cart' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    chinese_menu.add_dish('Fried Rice',10)
    uber_eat = UberEat.new(chinese_menu)
    uber_eat.add_to_cart('Dim Sum',2)
    uber_eat.add_to_cart('Fried Rice',3)
    expect(uber_eat.show_cart).to eq "Dim Sum => 2\nFried Rice => 3\nTotal: $40"
    uber_eat.remove_from_cart('Fried Rice',2)
    expect(uber_eat.show_cart).to eq "Dim Sum => 2\nFried Rice => 1\nTotal: $20"
  end

  it 'filters any dishes with quantity less than one' do
    chinese_menu = RestaurantMenu.new
    chinese_menu.add_dish('Dim Sum',5)
    uber_eat = UberEat.new(chinese_menu)
    uber_eat.add_to_cart('Dim Sum',2)
    uber_eat.remove_from_cart('Dim Sum',3)
    expect(uber_eat.show_cart).to eq "Total: $0"
  end

  it 'calls an API to send a text to confirm order' do
    # Do not test other people code
    # Test what I want my app do
    # Find the gem for testing twolio
    # Test the message content
    # To check if twolio works, a manual test can be done later
    # fake_sms = FakeSMS.new('sid','token')
    # fake_sms.create(from:'+17172948932',to:'+447563174825',body:'Thank you! Your order was placed and will be delivered before 18:52')
    # last_message = fake_sms.messages
    requester_twilio = FakeSMS.new('sid','token')
    chinese_menu = RestaurantMenu.new
    uber_eat = UberEat.new(chinese_menu,requester_twilio)
    time = Time.new(2023,01,25,13,0,0)
    result = uber_eat.order('+447563174825',time)
    expect(uber_eat.total_cost).to eq 0
    expect(result).to eq 'Thank you! Your order was placed and will be delivered before 13:10'
  end

  it 'calls an API to send a text to confirm order with rspec doubles' do
    requester_twilio = double :requester
    allow(requester_twilio).to receive(:messages).and_return(requester_twilio)
    message_info = {from:'+17172948932',to:'+447563174825',body:'Thank you! Your order was placed and will be delivered before 13:10'}
    allow(requester_twilio).to receive(:create).with(message_info).and_return('Thank you! Your order was placed and will be delivered before 13:10')

    chinese_menu = RestaurantMenu.new
    uber_eat = UberEat.new(chinese_menu,requester_twilio)
    time = Time.new(2023,01,25,13,0,0)
    result = uber_eat.order('+447563174825',time)
    expect(uber_eat.total_cost).to eq 0
    expect(result).to eq 'Thank you! Your order was placed and will be delivered before 13:10'
  end
end
