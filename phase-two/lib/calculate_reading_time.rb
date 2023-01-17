def calculate_reading_time(str)
    array = str.split(' ')
    return 0 if str == ''
    return 1 if array.length < 200 
    time = array.length / 200
    return time
end

