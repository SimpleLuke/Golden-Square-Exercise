class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0)
    # p counter
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
        # p "#{char} : #{counter[char]}"
        next unless is_letter?(char)
        counter[char] = (counter[char] || 1) + 1
        # binding.irb
        # p "Before IF: char:#{most_common} | count:#{most_common_count}"
        # p "value of char is #{counter[char]}"
      if counter[char] > most_common_count
        most_common = char
        most_common_count = counter[char]
        # p "char:#{most_common} | count:#{most_common_count}"
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]