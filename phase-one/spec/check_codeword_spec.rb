require 'check_codeword'

describe 'check_codeword' do
    it 'returns "Correct! Come in." if passed "horse"' do
        expect(check_codeword('horse')).to eq 'Correct! Come in.'
    end
    
    it 'returns "Close, but nope." if passed a string started with "h" and ended with "e"' do
        expect(check_codeword('he')).to eq 'Close, but nope.'
    end
    
    it 'returns "Wrong" if passed a string which is not started with "h" and ended with "e"' do
        expect(check_codeword('wrong')).to eq 'WRONG!'
    end

end