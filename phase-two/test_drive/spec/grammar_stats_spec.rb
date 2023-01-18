require 'grammar_stats'

describe GrammarStats do
    context 'returns true when passed a string begins with a capital letter and ends with a sentence-ending punctuation marks.' do
        it 'begins with a captial letter and ends with a period' do
            grammar_stats = GrammarStats.new
            result = grammar_stats.check('I am a boy.')
            expect(result).to eq true
        end
    end
end