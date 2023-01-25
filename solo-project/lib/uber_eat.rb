require 'rubygems'
require 'twilio-ruby'
require_relative '../env.rb'
class UberEat
  def initialize(menu,requester=Twilio::REST::Client)
    @requester = requester
    @menu = menu # [{name:'Dim Sum',price:5},...]
    @cart = [] # [{dish:'Dim Sum',quantity:2},...]
    # @client = Twilio::REST::Client.new(
    #   ENV["TWILIO_ACCOUNT_SID"],
    #   ENV["TWILIO_AUTH_TOKEN"],
    # )
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

  def order(phone,current_time)
    # account_sid = ENV['TWILIO_ACCOUNT_SID']
    # auth_token = ENV['TWILIO_AUTH_TOKEN']
    # client = Twilio::REST::Client.new(account_sid, auth_token)
    # client = @requester.new(account_sid, auth_token)
    client = @requester
    from = '+17172948932' # Your Twilio number
    to =  phone # Your mobile phone number

    delivered_time = current_time + 10*60 # 10 mintues
    message = "Thank you! Your order was placed and will be delivered before #{delivered_time.strftime('%H:%M')}"

    client.messages.create(
      from: from,
      to: to,
      body: message 
    )
    return message
  end
end


# account_sid = ENV['TWILIO_ACCOUNT_SID']
# auth_token = ENV['TWILIO_AUTH_TOKEN']
# uber = UberEat.new('Menu',Twilio::REST::Client.new(account_sid,auth_token))
# puts uber.order('+447563174825','18:52')
