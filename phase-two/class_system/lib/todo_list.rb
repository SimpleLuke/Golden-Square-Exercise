# File: lib/todo_list.rb
class TodoList
  def initialize
    @incomplete_list = []
  end

  def add(todo) # todo is an instance of Todo
    @incomplete_list.push(todo)
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
    @incomplete_list
  end

  def complete
    @incomplete_list.select {|todo| todo.done?}
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end