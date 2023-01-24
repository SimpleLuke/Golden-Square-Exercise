require 'string_repeater'

describe StringRepeater do
  it 'repeats the string' do
    io = double :io
    expect(io).to receive(:puts).with('Hello. I will repeat a string many times.').ordered
    expect(io).to receive(:puts).with('Please enter a string').ordered
    expect(io).to receive(:gets).and_return('CAT').ordered
    expect(io).to receive(:puts).with('Please enter a number of repeats').ordered
    expect(io).to receive(:gets).and_return('3').ordered
    expect(io).to receive(:puts).with('Here is your result:').ordered
    expect(io).to receive(:puts).with('CATCATCAT').ordered

    repeater = StringRepeater.new(io)
    repeater.run
  end
end
