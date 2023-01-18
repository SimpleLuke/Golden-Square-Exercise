require 'grammar_stats'

describe GrammarStats do
    context 'returns true when passed a string begins with a capital letter and ends with a sentence-ending punctuation marks.' do
        it 'begins with a captial letter and ends with a period' do
            grammar_stats = GrammarStats.new
            result = grammar_stats.check('I am a boy.')
            expect(result).to eq true
        end
        it 'begins with a captial letter and ends with a question mark' do
            grammar_stats = GrammarStats.new
            result = grammar_stats.check('I am a boy?')
            expect(result).to eq true
        end
        it 'begins with a captial letter and ends with a exclamation mark' do
            grammar_stats = GrammarStats.new
            result = grammar_stats.check('I am a boy!')
            expect(result).to eq true
        end
    end

    context 'returns false when passed a string which is NOT begins with a capital letter or ends with a sentence-ending punctuation marks.' do
        it 'begins with a lowercase letter' do
            grammar_stats = GrammarStats.new
            result = grammar_stats.check('i am a boy.')
            expect(result).to eq false
        end
        it 'ends without a sentence-ending punctuation mark.' do
            grammar_stats = GrammarStats.new
            result = grammar_stats.check('I am a boy')
            expect(result).to eq false
        end
    end
end