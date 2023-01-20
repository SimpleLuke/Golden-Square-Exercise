# File: lib/music_library.rb

class MusicLibrary
  def initialize
    # ...
    @track_list = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    @track_list.push(track)
    # Returns nothing
  end

  def all
    @track_list
    # Returns a list of track objects
  end
  
  def search(keyword) # keyword is a string
    return @track_list.select do |track|
        track.matches?(keyword)
    end
    # Returns a list of tracks that match the keyword
  end
end