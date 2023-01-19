require 'todo_list'
require 'todo'

describe 'Todo List integration' do
    before(:each) do
        @todo_list = TodoList.new
        @todo_1 = Todo.new('Walk the dog')
        @todo_2 = Todo.new('Clean the dishes')
        @todo_3 = Todo.new('Buy towels')
        @todo_list.add(@todo_1)
        @todo_list.add(@todo_2)
        @todo_list.add(@todo_3)
    end
    it 'adds todo instances and returns all non-done todos as an array' do
        # todo_list = TodoList.new
        # todo_1 = Todo.new('Walk the dog')
        # todo_2 = Todo.new('Clean the dishes')
        # todo_list.add(todo_1)
        # todo_list.add(todo_2)
        expect(@todo_list.incomplete).to eq [@todo_1,@todo_2,@todo_3]
    end

    it 'returns a array list including all the todos marked as done and the completed task disappear from the incomplete list' do
        @todo_1.mark_done!
        @todo_2.mark_done!
        expect(@todo_list.complete).to eq [@todo_1,@todo_2]
        expect(@todo_list.incomplete).to eq [@todo_3]
    end

    it 'marks all todos as complete and returns a complete list as an array' do
        @todo_list.give_up!
        expect(@todo_list.complete).to eq [@todo_1,@todo_2,@todo_3]
    end
end