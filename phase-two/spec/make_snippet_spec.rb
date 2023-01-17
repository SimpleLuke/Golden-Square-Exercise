require 'make_snippet'

describe 'make_snippet method' do
    it 'returns the first five words' do
        expect(make_snippet('Hello')).to eq 'Hello'
    end

    it 'adds "..." if the string is more than 5 characters' do
        expect(make_snippet('Hello, Peter')).to eq 'Hello...'
    end
end