
class ToDo 
  def initialize(task)
    @task = task
    @done = false
  end

  def show_task
    @task
  end

  def mark_done!
    @done = true
  end

  def is_done?
    @done
  end
end
