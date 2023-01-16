require 'gratitudes'

describe Gratitudes do
    it 'returns a formatted string from an array of gratitudes when no gratitude is added' do
        gratitudes = Gratitudes.new
        format = gratitudes.format
        expect(format).to eq 'Be grateful for: '
    end

    it 'adds gratitudes to the array and returns a formatted string with the gratitudes' do
        gratitudes = Gratitudes.new
        gratitudes.add(['Jenny','Tony','Paul'])
        format = gratitudes.format
        expect(format).to eq 'Be grateful for: Jenny, Tony, Paul'
    end
end