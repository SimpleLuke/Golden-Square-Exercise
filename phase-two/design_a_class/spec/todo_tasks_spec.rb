require 'todo_tasks'

describe TodoTasks do
    it 'adds nothing when passed an empty string' do
        todo_tasks = TodoTasks.new
        expect(todo_tasks.add_todo('')).to eq []
    end

    it 'returns an updated array when added a task' do
        todo_tasks = TodoTasks.new
        expect(todo_tasks.add_todo('Buy apple')).to eq ['Buy apple']
    end

    it 'returns a todo list as an array which includes all the added tasks' do
        todo_tasks = TodoTasks.new
        todo_tasks.add_todo('Buy apple')
        expect(todo_tasks.todo_list).to eq ['Buy apple']
    end

    it 'marks the task as completed and returns an updated array' do
        todo_tasks = TodoTasks.new
        todo_tasks.add_todo('Buy apple')
        todo_tasks.add_todo('Buy orange')
        expect(todo_tasks.complete_todo('Buy apple')).to eq ['Buy orange']
    end

    it 'returns the completed list which representing all the tasks maked as completed' do
        todo_tasks = TodoTasks.new
        todo_tasks.add_todo('Buy apple')
        todo_tasks.complete_todo('Buy apple')
        expect(todo_tasks.completed_list).to eq ['Buy apple']
    end
end