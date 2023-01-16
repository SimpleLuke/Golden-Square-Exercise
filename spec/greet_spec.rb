require 'greet'

describe 'greet' do
    it 'returns "Hello, Jenny!"' do
        expect(greet('Jenny')).to eq 'Hello, Jenny!'
    end
end