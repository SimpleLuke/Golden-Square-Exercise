class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @reading_index = {start:0, last:0}
  end

  def title
    # Returns the title as a string
    @title
  end

  def contents
    # Returns the contents as a string
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    array = @contents.split(' ')
    return array.length
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    array = @contents.split(' ')
    return 0 if @contents == ''
    return 1 if array.length < wpm 
    time = array.length / wpm
    return time
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    reading_words = wpm * minutes
    contents_array = @contents.split(' ')
    if contents_array.length <= reading_words
      return @contents
    else  
      output = []
      @reading_index[:last] = @reading_index[:start] + reading_words - 1
      # p @reading_index[:last]
      contents_array.each_with_index do |words, index|
        if index >= @reading_index[:start] && index <= @reading_index[:last]
          output.push(words)
        end
      end
      @reading_index[:start] = @reading_index[:last] + 1
      if @reading_index[:start] > contents_array.length - 1
        @reading_index[:start] = 0
      end
      return output.join(' ')
    end
  end
end