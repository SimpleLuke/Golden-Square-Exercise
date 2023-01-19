# File: lib/todo_list.rb
class TodoList
  def initialize
    @incomplete_list = []
    @complete_list = []
  end

  def add(todo) # todo is an instance of Todo
    @incomplete_list.push(todo)
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
    @incomplete_list.select! {|task| !task.done?}
    @incomplete_list
  end

  def complete
    @incomplete_list.each {|task| @complete_list.push(task) if task.done?}
    @complete_list
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
    @incomplete_list.each do |task|
        task.mark_done!
    end
  end
end