require 'grammar_check'

describe 'grammar_check method' do
    it 'returns ture when passed "I am a boy."' do
        expect(grammar_check('I am a boy.')).to eq true
    end
    it 'returns ture when passed "i am a boy"' do
        expect(grammar_check('i am a boy')).to eq false
    end
    it 'returns ture when passed "I am a boy"' do
        expect(grammar_check('I am a boy')).to eq false
    end
    it 'returns ture when passed "i am a boy."' do
        expect(grammar_check('i am a boy.')).to eq false
    end
end