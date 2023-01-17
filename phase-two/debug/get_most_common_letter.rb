def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    if char != ' '
        counter[char] += 1
    end
    p "the #{char} have number of #{counter[char]} now"
  end
  p counter.to_a.sort_by{|k,v| v}[-1][0]
  counter.to_a.sort_by { |k, v| v }[-1][0]
end

p get_most_common_letter("the roof, the roof, the roof is on fire!") == 'o'

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
