require 'todo'

describe Todo do
    it 'returns the task as a string' do
        todo_1 = Todo.new('Walk the dog')
        expect(todo_1.task).to eq 'Walk the dog'
    end
end