require 'string_builder'

describe StringBuilder do
    it 'returns empty string' do
        stringbuilder = StringBuilder.new
        output = stringbuilder.output
        expect(output).to eq ''
    end

    it 'returns the length of the string which is 0' do
        stringbuilder = StringBuilder.new
        size = stringbuilder.size
        expect(size).to eq 0
    end

    it 'adds "Jenny" to the string. The output is "Jenny" with the size of 5' do
        stringbuilder = StringBuilder.new
        stringbuilder.add('Jenny')
        expect(stringbuilder.output).to eq 'Jenny'
        expect(stringbuilder.size).to eq 5
    end
end