# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class TodoTasks do
    def initialize
        # a variable to store the todo list
        # a variable to store the completed list
    end

    def add_todo(task) #task is a string
        #returns an array for the todo tasks
    end

    def complete_todo(task) #task is a string
        # marks the task as complete and takes it out from the array
        # returns the updated array
    end

    def todo_list
        # returns the todo list as an array
    end

    def completed_list
        # returns the completed tasks as an array
    end
end

```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

# 1
todo_tasks = TodoTasks.new
todo_tasks.add_todo('') # => []

# 2
todo_tasks = TodoTasks.new
todo_tasks.add_todo('Buy apple') # => ['Buy apple']

# 3
todo_tasks = TodoTasks.new
todo_tasks.add_todo('Buy apple')
todo_tasks.add_todo('Buy orange')
todo_tasks.todo_list # => ['Buy apple','Buy orange']

# 4
todo_tasks = TodoTasks.new
todo_tasks.add_todo('Buy apple')
todo_tasks.add_todo('Buy orange')
todo_tasks.complete_todo('Buy apple') # => ['Buy orange']

# 5
todo_tasks = TodoTasks.new
todo_tasks.add_todo('Buy apple')
todo_tasks.complete_todo('Buy apple')
todo_tasks.completed_list # => ['Buy apple']

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
