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

## 2. Design the Class System

```
┌────────────────────────────────────┐
│  UberEat(Menu)                     │
│                                    │
│  - show_dishes                     │
│  - add_to_cart(dish,quantity)      │
│  - remove_from_cart(dish,quantity) │
│  - show_cart                       │
│                                    │
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
    # Dish gets added to the cart with the input quantity.
    # puts a message 'Successfully added!'
    # Returns nothing.
  end

  def remove_from_cart(dish,quantity) # dish is a string; quantity is a integer
    # Dish gets removed from the cart with the input quantity.
    # puts a message 'Successfully removed!'
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
    # puts a message 'Successfully added!'
    # Returns nothing.
  end

  def remove_dish(name) # name is a string
    # Dish gets removed from the menu.
    # puts a message 'Successfully removed!'
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
uber_eat.show_dishes # => [{'Dim Sim': 5, 'Fried Rice': 10}]

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
chinese_menu.show_menu # => [{"Dim Sum"=> 5},{"Fried Rice"=>10}]

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
