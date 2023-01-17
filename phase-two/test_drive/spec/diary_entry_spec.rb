require 'diary_entry'

describe DiaryEntry do
    before(:each) do
        @diary_entry = DiaryEntry.new('Books','Story')
    end

    it 'returns the title as a string when using the title method' do
        expect(@diary_entry.title).to eq 'Books'
    end

    it 'returns the contents as a string when using the contents method' do
        expect(@diary_entry.contents).to eq 'Story'
    end

    it 'returns the number of words in the contents as an integer' do
        expect(@diary_entry.count_words).to eq 5
    end

    it 'returns an integer representing an estimate of the reading time in minutes when passed a wpm' do
        expect(@diary_entry.reading_time(200)).to eq 1
    end

    it 'returns a string with a chunk of the contents that the user could read in the given number of minutes.' do
        contents = 'Story ' * 200
        long_story = DiaryEntry.new('Long Story', contents)
        expect(long_story.reading_chunk(200, 1)).to eq('Story ' * 200)
    end

    it 'returns the next chunk of the contents when reading_chunk called more than once' do
        contents = 'Today is a great day. And I want an ice-cream.'
        long_story = DiaryEntry.new('Long Story', contents)
        expect(long_story.reading_chunk(5, 1)).to eq('Today is a great day.')
        expect(long_story.reading_chunk(5, 1)).to eq('And I want an ice-cream.')
    end

    it 'should restart from the beginning if the contents is fully read.' do
        contents = 'Today is a great day. And I want an ice-cream.'
        long_story = DiaryEntry.new('Long Story', contents)
        expect(long_story.reading_chunk(5, 1)).to eq('Today is a great day.')
        expect(long_story.reading_chunk(5, 1)).to eq('And I want an ice-cream.')
        expect(long_story.reading_chunk(5, 1)).to eq('Today is a great day.')
    end
end