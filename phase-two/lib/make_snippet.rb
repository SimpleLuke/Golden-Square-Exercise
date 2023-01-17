def make_snippet(str)
    output = ''
    str = str.split(" ")
    if str.length > 5
        str.each_with_index do |char, index|
            if index < 5
                output += char + ' '
            end
        end
        output[-1] = ''
        return output + '...'
    else
        return str.join(' ')
    end    
end