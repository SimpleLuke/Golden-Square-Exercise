require 'Diary'

describe Diary do
  it 'returns contets' do
    diary = Diary.new('I walk my baby')
    expect(diary.read).to eq 'I walk my baby'
  end
end
