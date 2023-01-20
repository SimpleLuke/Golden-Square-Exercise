require 'track'

describe Track do
    it 'matches when given a keyword in the title' do
        track = Track.new('one MATCHES two', 'three four')
        expect(track.matches?("MATCHES")).to eq true
    end
    it 'matches when given a keyword in the artist' do
        track = Track.new('one two', 'three MATCHES four')
        expect(track.matches?("MATCHES")).to eq true
    end

    it 'does not match when the keyword is present in neither' do
        track = Track.new('one two', 'three four')
        expect(track.matches?("MATCHES")).to eq false
    end
end