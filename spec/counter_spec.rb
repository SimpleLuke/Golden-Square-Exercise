require 'counter'

describe Counter do
    it 'reports the number of counts to user' do
        counter = Counter.new
        report = counter.report
        expect(report).to eq 'Counted to 0 so far.'
    end

    it 'adds the counter to 3' do
        counter = Counter.new
        counter.add(3)
        report = counter.report
        expect(report).to eq 'Counted to 3 so far.'
    end
end