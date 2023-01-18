def grammar_check(sentence)
    if sentence[0] == sentence[0].upcase
        # if sentence.rindex(/[[:punct:]]/) == sentence.length-1
        if sentence.rindex(/[.?!]/) == sentence.length-1
            return true
        end
    end
return false 
end