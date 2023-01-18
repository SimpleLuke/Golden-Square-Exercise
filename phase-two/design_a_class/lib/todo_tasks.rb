class TodoTasks
    def initialize
        @todo_list = []
        @completed_list = []
    end

    def add_todo(task)
        if task != ''
           @todo_list.push(task) 
        end
        @todo_list
    end

    def todo_list
        @todo_list
    end

    def complete_todo(task)
        @completed_list.push(task)
        @todo_list = @todo_list.select {|todo| todo != task}
        @todo_list
    end

    def completed_list
        @completed_list
    end
end