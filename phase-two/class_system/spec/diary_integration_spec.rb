require 'diary'
require 'diary_entry'

describe "Diary Integration" do
    it 'returns a list of instances of DiaryEntry' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('Yesterday', 'I am not happy')
        entry_2 = DiaryEntry.new('Today','I am happy')
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.all).to eq [entry_1, entry_2]
    end

    it 'returns the number of words in all diary entries' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('Yesterday', 'I am not happy')
        entry_2 = DiaryEntry.new('Today','I am happy')
        diary.add(entry_1)
        diary.add(entry_2)
        count_1 = entry_1.count_words
        count_2 = entry_2.count_words
        expect(diary.count_words).to eq(count_1 + count_2)
    end

    it 'returns a reading time if the user were to read all entries in the diary' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('Yesterday', 'I am not happy')
        entry_2 = DiaryEntry.new('Today','I am happy')
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.reading_time(7)).to eq 1
    end

    it 'returns an instance of diary entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('Yesterday', 'I am not happy')
        entry_2 = DiaryEntry.new('Today','I am happy')
        entry_3 = DiaryEntry.new('Today','Hello')
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        expect(diary.find_best_entry_for_reading_time(1,3)).to eq entry_2
    end
end