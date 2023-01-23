require 'secret_diary'
require 'diary'

describe 'secret diary integration' do
  it 'raise an error if the diary is locked' do
    diary = Diary.new("I walk my baby")
    secret_diary = SecretDiary.new(diary)
    expect {secret_diary.read}.to raise_error "Go away!"
  end 

  it 'returns the diary contents if the diary is unlocked' do
    diary = Diary.new("I walk my baby")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq 'I walk my baby'
  end
  
  it 'raises an error when the unlocked diary is locked again' do
    diary = Diary.new("I walk my baby")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect {secret_diary.read}.to raise_error "Go away!"
  end
end
