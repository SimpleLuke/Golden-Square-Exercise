# File: lib/todo.rb
class Todo
    def initialize(task) # task is a string
      @task = task
      @is_done = false
    end
  
    def task
      # Returns the task as a string
    end
  
    def mark_done!
      # Marks the todo as done
      @is_done = true
      # Returns nothing
    end
  
    def done?
      # Returns true if the task is done
      @is_done
      # Otherwise, false
    end
end