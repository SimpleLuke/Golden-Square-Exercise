require 'secret_diary'

describe SecretDiary do
  it 'raises an error when the diary is locked' do
    diary = double(:diary, read:'Walk my baby')
    secret_diary = SecretDiary.new(diary)
    expect {secret_diary.read}.to raise_error 'Go away!'
  end

  it 'returns the content when the diary is unlocked' do
    diary = double(:diary, read:'Walk my baby')
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq 'Walk my baby'
  end

  it 'raises an error when the unlocked diary is locked again' do
    diary = double(:diary, read:'Walk my baby')
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect {secret_diary.read}.to raise_error 'Go away!'
  end
end
