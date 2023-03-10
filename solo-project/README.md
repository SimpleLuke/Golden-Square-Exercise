## 1. Describe the Problem

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

```
┌────────────────────────────────────┐
│  UberEat(Menu)                     │
│                                    │
│  - show_dishes                     │
│  - add_to_cart(dish,quantity)      │
│  - remove_from_cart(dish,quantity) │
│  - show_cart                       │
│  - order(phone)                    │
└──────────────────▲─────────────────┘
                   │
                   │
┌──────────────────┴─────────────────┐
│  RestaurantMenu                     │
│                                    │
│  - add_dish(name,price)            │
│  - remove_dish(name)               │
|  - show_menu                       |
└────────────────────────────────────┘
```

```ruby
class UberEat
  def initialize(Menu) # Menu is an instance representing a list of dishes
    # ...
  end

  def show_dishes
    # Returns all the available dishes and prices => Hash
  end

  def add_to_cart(dish, quantity) # dish is a string; quantity is a integer
    # Raise a fail if the dish is not on the menu.
    # Dish gets added to the cart with the input quantity.
    # Returns nothing.
  end

  def remove_from_cart(dish,quantity) # dish is a string; quantity is a integer
    # Dish gets removed from the cart with the input quantity.
    # Returns nothing.
  end

  def show_cart
    # Returns a list of added dishes => Hash
  end
end

class RestaurantMenu
  def initialize
    # ...
  end

  def add_dish(name,price) # name is a string; price is a integer
    # Dish name gets added to the menu with the price.
    # Returns nothing.
  end

  def remove_dish(name) # name is a string
    # Dish gets removed from the menu.
    # Returns nothing.
  end

  def show_menu
    # Returns the menu list with dishes name and prices => Hash
  end
end
```

## 3. Create Examples as Integration Tests

```ruby
# EXAMPLE

# Gets no available dishes from the empty menu
chinese_menu = RestaurantMenu.new
uber_eat = UberEat.new(chinese_menu)
uber_eat.show_dishes # => []

# Gets available dishes from the menu
chinese_menu = RestaurantMenu.new
chinese_menu.add_dish('Dim Sum',5)
chinese_menu.add_dish('Fried Rice',10)
uber_eat = UberEat.new(chinese_menu)
uber_eat.show_dishes # => [{name:'Dim Sum',price:5},{name:'Fried Rice',price:10}]

# Adds dishes to the cart and returns a list
chinese_menu = RestaurantMenu.new
chinese_menu.add_dish('Dim Sum',5)
uber_eat = UberEat.new(chinese_menu)
uber_eat.add_to_cart('Dim Sum', 2) # Adds two Dim Sum into the cart
uber_eat.show_cart # => "[{"Dim Sum" => 2}] Total: $10"
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a menu
chinese_menu = RestaurantMenu.new
chinese_menu.show_menu # => []

# Add dishes to the menu
chinese_menu = RestaurantMenu.new
chinese_menu.add_dish('Dim Sum',5)
chinese_menu.add_dish('Fried Rice',10)
chinese_menu.show_menu # => [{name:'Dim Sum',price:5},{name:'Fried Rice',price:10}]

# Remove dishes to the menu
chinese_menu = RestaurantMenu.new
chinese_menu.add_dish('Dim Sum',5)
chinese_menu.add_dish('Fried Rice',10)
chinese_menu.remove_dish('Fried Rice')
chinese_menu.show_menu # => [{name:"Dim Sum",price:5}]

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---
