require 'todo'

describe ToDo do
    before(:each) do
        @todo = ToDo.new('wash my frog')
    end

    it 'returns task string' do
        expect(@todo.show_task).to eq 'wash my frog'
    end

    it 'returns true if the task is marked as done' do
        @todo.mark_done!
        expect(@todo.is_done?).to eq true
    end
end