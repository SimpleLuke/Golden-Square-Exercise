require 'diary'
require 'entry'
require 'todo'

describe Diary do
    before(:each) do
        @diary = Diary.new
        @entry1 = Entry.new('a poem','on this sunny morning, i went on a walk')
        @entry2 = Entry.new('a song','on this raining night, i danced in the rain')
        @todo1 = ToDo.new('wash my frog')
        @todo2 = ToDo.new('drink at Leons')
    end

    context 'testing Entry functionality' do
        it 'returns a message when no entries in the diary' do
            expect(@diary.all_titles).to eq 'You have no entries currently.'
        end
    
        it 'adds entry to the diary and returns all the titles as an array' do
            @diary.add(@entry1)
            @diary.add(@entry2)
            expect(@diary.all_titles).to eq [@entry1,@entry2]
        end
    
        it 'raises an error if the entry title does not exist' do
            expect{@diary.read_entry(@entry1.title)}.to raise_error 'This entry does not exist.'
        end
    
        it 'searches the title from the list and returns the entry content' do
            @diary.add(@entry1)
            @diary.add(@entry2)
            expect(@diary.read_entry(@entry1.title)).to eq'on this sunny morning, i went on a walk'
        end
    
        it "returns the instance of the best entry for the user to read based on the wpm & numbers of minutes" do
            entry3 = Entry.new('a poem','i went on a walk')
            entry4 = Entry.new('a song','on this stormy rainy night, i danced in the rain')
            @diary.add(entry3)
            @diary.add(entry4)
            result = @diary.find_best_entry(1,5)
            expect(result).to eq entry3
        end
    
        it "returns an array of all the phone numbers found in every entry" do
            entry5 = Entry.new('a number','This is 07123456789. And Ryan 07123456710')
            entry6 = Entry.new('a number','This is 07123459289. And Ryan 0212345678')
            @diary.add(entry5)
            @diary.add(entry6)
            result = @diary.show_all_numbers()
            expect(result).to eq [['07123456789','07123456710'],['07123459289','0212345678']]
        end
    
        it "returns an array of all the phone numbers found in every entry" do
            entry5 = Entry.new('a number','This is 07123456789. And Ryan 07123456710')
            entry6 = Entry.new('a number','This is 07123459289. And Ryan 0212345678')
            @diary.add(@entry1)
            @diary.add(entry5)
            @diary.add(entry6)
            result = @diary.show_all_numbers()
            expect(result).to eq [['07123456789','07123456710'],['07123459289','0212345678']]
        end
    end
    
    context 'testing ToDo functionality' do
        it 'returns all current tasks' do
            @diary.add(@todo1)
            @diary.add(@todo2)
            result = @diary.show_tasks()
            expect(result).to eq [@todo1,@todo2]
        end

        it 'returns all current tasks without the completed task' do
            @diary.add(@todo1)
            @diary.add(@todo2)
            @todo1.mark_done!
            result = @diary.show_tasks()
            expect(result).to eq [@todo2]
        end
    end
end