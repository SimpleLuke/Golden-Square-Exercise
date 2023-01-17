require 'make_snippet'

describe 'make_snippet method' do
    it 'returns the first five words' do
        expect(make_snippet('Hello, Peter is here now.')).to eq 'Hello, Peter is here now.'
    end

    it 'adds "..." if the string is more than 5 characters' do
        expect(make_snippet('Hello, Peter is not here now.')).to eq 'Hello, Peter is not here...'
    end
end