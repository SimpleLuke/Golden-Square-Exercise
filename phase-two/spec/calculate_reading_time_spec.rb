require 'calculate_reading_time'

describe 'calculate_reading_time method' do
    it 'returns 0 when passed empty string' do
        expect(calculate_reading_time('')).to eq 0
    end

    it 'returns 1 when passed "one"' do
        expect(calculate_reading_time('one')).to eq 1
    end

    it 'returns 1 when passed two hundred words' do
        expect(calculate_reading_time('one '*200)).to eq 1
    end

    it 'returns 2 when passed four hundred words' do
        expect(calculate_reading_time('one '*400)).to eq 2
    end

    it 'returns 5 when passed one thousand words' do
        expect(calculate_reading_time('one '*1000)).to eq 5
    end
end