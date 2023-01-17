# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

```ruby
is_todo = check_todo(text)

text is a string which will pass as an argument.
is_todo is a boolean which represents if the text includes the string #TODO
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

check_todo('#TODO Clean dishes') => true
check_todo('') => false
check_todo('Go shopping #TODO') => true
check_todo('Have dinner #TODO Buy towels') => true

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
