require 'music_list'

describe MusicList do
    it 'will not add the music if it is an empty string' do
        music_list = MusicList.new
        expect(music_list.add_music('')).to eq []
    end

    it 'adds a track with the input name to the list and returns the updated list as an array' do
        music_list = MusicList.new
        expect(music_list.add_music('Happy Birthday')).to eq ['Happy Birthday']
    end

    it 'returns an empty list when no track is added to the list' do
        music_list = MusicList.new
        expect(music_list.music_listened_list).to eq []
    end

    it 'returns a list as an array including all the tracks added' do
        music_list = MusicList.new
        music_list.add_music('Happy Birthday')
        music_list.add_music('Merry Christmas')
        expect(music_list.music_listened_list).to eq ['Happy Birthday','Merry Christmas']
    end
end