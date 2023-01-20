# File: lib/track.rb

class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    if @title.include?(keyword) || artist.include?(keyword)
        return true
    end
    # Returns true if the keyword matches either the title or artist
  end
end