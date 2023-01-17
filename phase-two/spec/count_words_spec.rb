require 'count_words'

describe 'count_words method' do
    it 'retuns 4 when passed "Hello, how are you?"' do
        expect(count_words('Hello, how are you?')).to eq 4
    end
end