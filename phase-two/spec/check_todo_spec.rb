require 'check_todo'

describe 'check_todo method' do
    it 'returns true if the text includes "#TODO"' do
        expect(check_todo('#TODO Clean dishes')).to eq true
    end

    it 'retuns false if the text is an empty string' do
        expect(check_todo('')).to eq false
    end
end