require 'todo_list'
require 'todo'

describe 'Todo List integration' do
    before(:each) do
        @todo_list = TodoList.new
        @todo_1 = Todo.new('Walk the dog')
        @todo_2 = Todo.new('Clean the dishes')
        @todo_list.add(@todo_1)
        @todo_list.add(@todo_2)
    end
    it 'adds todo instances and returns all non-done todos as an array' do
        # todo_list = TodoList.new
        # todo_1 = Todo.new('Walk the dog')
        # todo_2 = Todo.new('Clean the dishes')
        # todo_list.add(todo_1)
        # todo_list.add(todo_2)
        expect(@todo_list.incomplete).to eq [@todo_1,@todo_2]
    end

    it 'returns a array list including all the todos marked as done' do
        todo_list = TodoList.new
    end
end