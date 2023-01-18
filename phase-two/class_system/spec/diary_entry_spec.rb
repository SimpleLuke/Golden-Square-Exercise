require 'diary_entry'

describe DiaryEntry do
    before(:each) do
        @entry_1 = DiaryEntry.new('Yesterday','I am not happy')
    end
    it 'returns the title' do
        expect(@entry_1.title).to eq 'Yesterday'
    end
    it 'returns the contents' do
        expect(@entry_1.contents).to eq 'I am not happy'
    end
    it 'returns the count of the contents' do
        expect(@entry_1.count_words).to eq 4
    end
    it 'returns the reading time for the diary entry contents' do
        expect(@entry_1.reading_time(4)).to eq 1
    end

    it 'should restart from the beginning if the contents is fully read.' do
        contents = 'Today is a great day. And I want an ice-cream.'
        long_story = DiaryEntry.new('Long Story', contents)
        expect(long_story.reading_chunk(5, 1)).to eq('Today is a great day.')
        expect(long_story.reading_chunk(5, 1)).to eq('And I want an ice-cream.')
        expect(long_story.reading_chunk(5, 1)).to eq('Today is a great day.')
    end
end