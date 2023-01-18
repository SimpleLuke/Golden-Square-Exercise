class GrammarStats
  def initialize
    @check_times = 0
    @check_correct = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    @check_times += 1
    if text[0] == text[0].upcase
      if text.rindex(/[.?!]/) == text.length-1
          @check_correct += 1
          return true
      end
    end
    return false 
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    # p @check_times
    # p @check_correct
    return ((@check_correct/@check_times.to_f) * 100).floor
  end
end