require 'music_library'
# require 'track'

describe MusicLibrary do
    let(:track_1) {instance_double("Track")}
    let(:track_2) {instance_double("Track")}
    it 'adds a track twice and returns all track objects' do
        music_library = MusicLibrary.new
        music_library.add(:track_1)
        music_library.add(:track_2)
        expect(music_library.all).to eq [:track_1,:track_2]
    end
end