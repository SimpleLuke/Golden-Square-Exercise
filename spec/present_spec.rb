require 'present'

describe Present do
    it 'wraps and unwarps a present' do
        present = Present.new
        present.wrap('toy')
        expect(present.unwrap).to eq 'toy'
    end
    context 'when no contents' do
        it 'fails when try to unwrap' do
            present = Present.new
            expect {present.unwrap()}.to raise_error "No contents have been wrapped."
        end

        it 'fails when try to wrap more than one time' do
            present = Present.new
            present.wrap('toy')
            expect {present.wrap('apple')}.to raise_error "A contents has already been wrapped."
            expect(present.unwrap).to eq 'toy'
        end
    end
end