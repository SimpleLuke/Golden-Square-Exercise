# Journal Design Recipe

## 1. Describe the Problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

Diagram made using asciiflow.com:

```
               ┌────────────────────────────────────┐
               │Diary                               │
               │                                    │
               │                                    │
               │- add(entry/task)                   │
               │- all_titles                        │
               │- read_entry(entry_title)           │
               │- find_best_entry(wpm, minutes)     │
               │- show_tasks                        │
               │- show_all_numbers                  │
               │                                    │
               ├────────────────────────────────────┤
               │                                    │
               ▼                                    ▼
               │                                    │
               │                                    │
┌──────────────┴─────────┐      ┌───────────────────┴───┐
│Entry(title, contents)  │      │ToDo(task)             │
│                        │      │                       │
│                        │      │                       │
│- title                 │      │- show_task            │
│- contents              │      │- mark_done!           │
│- count_words           │      │- is_done?             │
│- show_numbers          │      │                       │
└────────────────────────┘      └───────────────────────┘
```

```ruby

# Diary class
class Diary
    def initialize
        # ...
    end

    def add(entry) #entry is an instance of Entry
        # Entry gets added to the Diary
        # Returns nothing
    end

    def all_titles
        # returns all the entries titles as an array
    end

    def read_entry(title) #title is a string
        # search title from all entries
        # return the contents of the target entry
    end

    def find_best_entry(wpm, minutes) # both are integers
         # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
        # Returns an instance of diary entry representing the entry that is closest 
         # to, but not over, the length that the user could read in the minutes they
        # have available given their reading speed.
    end

    def show_tasks
        # returns all the todo tasks as an array
    end

    def show_all_numbers
        # returns all the phone numbers from the entries contents
    end

end

# Entry class
class Entry 
  def initialize(title, contents) # both arguments are strings
    # title gets added to the entry
    # contents gets added to the entry
    # Returns nothing
  end

  def title
    # returns title (a string)
  end

  def contents
    # returns contents (a string)
  end

  def count_words
    # returns total number of words in contents (an integer)
  end

  def show_numbers
    # returns all the phone numbers from this entry
  end
end

class Todo
    def initialize(task) # a string
        # @task = task
        # @is_completed = false
    end

    def show_task
        # returns a task as a string
    end

    def mark_done!
        # marks task as done
    end

    def is_done?
        # returns true if it is done
        # Otherwise, returns false
    end
end

```

## 3. Create Examples as Integration Tests

```ruby

# Diary x Entry

# 1 
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
entry2 = Entry.new('a song','on this raining night, i danced in the rain')
diary = Diary.new()
diary.add(entry1)
diary.add(entry2)
diary.all_titles() # => [entry1, entry2]

# 2
diary = Diary.new()
diary.all_titles() # => 'You have no entries currently.'

# 3
diary = Diary.new()
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
diary.read_entry(entry1.title) # => 'This entry does not exist.' (error message)

# 4
diary = Diary.new()
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
entry2 = Entry.new('a song','on this raining night, i danced in the rain')
diary.add(entry1)
diary.add(entry2)
diary.read_entry(entry1) # => 'on this sunny morning, i went on a walk'

# 5
diary = Diary.new()
entry3 = Entry.new('a poem','i went on a walk')
entry4 = Entry.new('a song','on this stormy rainy night, i danced in the rain')
diary.add(entry3)
diary.add(entry4)
diary.find_best_entry(1,5) # => entry1

# 6
diary = Diary.new()
entry5 = Entry.new('a number','This is 07123456789. And Ryan 07123456710')
entry6 = Entry.new('a number','This is 07123459289. And Ryan 0212345678')
diary.add(entry5)
diary.add(entry6)
diary.show_all_numbers() # => [['07123456789','07123456710'],['07123459289','0212345678']]

# 7
diary = Diary.new()
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
entry5 = Entry.new('a number','This is 07123456789. And Ryan 07123456710')
entry6 = Entry.new('a number','This is 07123459289. And Ryan 0212345678')
diary.add(entry1)
diary.add(entry5)
diary.add(entry6)
diary.show_all_numbers() # => [['07123456789','07123456710'],['07123459289','0212345678']]

# Diary x ToDo

# 1
diary = Diary.new()
todo1 = ToDo.new('wash my frog')
todo2 = ToDo.new('drink at Leons')
diary.add(todo1)
diary.add(todo2)
diary.show_tasks() # => [todo1, todo2]

# 2
diary = Diary.new()
todo1 = ToDo.new('wash my frog')
todo2 = ToDo.new('drink at Leons')
diary.add(todo1)
diary.add(todo2)
todo1.mark_done!
diary.show_tasks() # => [todo2]

```

## 4. Create Examples as Unit Tests

```ruby

# Entry

# 1 
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
entry.title() # => 'a poem'

# 2
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
entry.contents() # => 'on this sunny morning, i went on a walk'

# 3
entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
entry.count_words() # => 9

# 4
entry5 = Entry.new('a number','This is 07123456789. And Ryan 07123456710')
entry5.show_numbers # => ['07123456789','07123456710']

# ToDo

# 1
todo = ToDo.new('wash my frog')
todo.show_task() # => 'wash my frog'


```

## 5. Implement the Behaviour
_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._