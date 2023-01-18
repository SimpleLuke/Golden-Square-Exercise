class Diary
  def initialize
    @entry_list = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entry_list.push(entry)
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
    @entry_list
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    count = @entry_list.reduce(0) do |total, entry|
        total = total + entry.count_words
    end
    count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    count = self.count_words
    time = count / wpm
    return time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    best_entries = []
    @entry_list.each do |entry|
        if entry.reading_time(wpm) <= minutes
            best_entries.push(entry)
        end
    end
    best_entries.sort {|a,b| b.reading_time(wpm) <=> a.reading_time(wpm)}
    best_entries[0]
  end
end