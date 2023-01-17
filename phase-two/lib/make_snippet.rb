def make_snippet(str)
    output = ''
    if str.length > 5
        str = str.split("")
        str.each_with_index do |char, index|
            if index < 5
                output += str[index]
            end
        end
        return output + '...'
    else
        return str
    end    
end