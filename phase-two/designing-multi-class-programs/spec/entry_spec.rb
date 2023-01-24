require 'entry'

describe Entry do
    before(:each) do
        @entry = Entry.new('a poem','on this sunny morning, i went on a walk')
    end

    it 'returns title' do
        expect(@entry.title).to eq 'a poem'
    end

    it 'returns contents' do
        expect(@entry.contents).to eq 'on this sunny morning, i went on a walk'
    end

    it 'returns number of words in contents' do
        expect(@entry.count_words).to eq 9
    end

    it 'returns an array of all the phone numbers found in this entry' do
        entry5 = Entry.new('a number','This is 07123456789. And Ryan 07123456710')
        expect(entry5.show_numbers).to eq ['07123456789','07123456710']
    end
end