require 'report_length'

describe 'report_length' do
    it 'returns the length of the string and put it in a sentence' do
        expect(report_length('Jenny')).to eq 'This string was 5 characters long.'
    end
end