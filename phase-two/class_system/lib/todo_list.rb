# File: lib/todo_list.rb
class TodoList
  def initialize
    @all_tasks = []
    # @incomplete_list = []
    # @complete_list = []
  end

  def add(todo) # todo is an instance of Todo
    @all_tasks.push(todo)
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
    incomplete_list = @all_tasks.select {|task| !task.done?}
    incomplete_list
  end

  def complete
    complete_list = @all_tasks.select {|task| task.done?}
    complete_list
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
    @all_tasks.each do |task|
        task.mark_done!
    end
  end
end