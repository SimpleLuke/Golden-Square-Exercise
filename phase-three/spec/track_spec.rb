require 'track'

describe Track do
    it 'returns true if the keyword matches either the title or artist' do
        track = Track.new('Happy Birthday','Paul')
        expect(track.matches?('Happy')).to eq true
    end
end