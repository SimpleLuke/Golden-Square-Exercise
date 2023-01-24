class Entry
    def initialize(title,contents)
        @title = title
        @contents = contents
        @phone_list = []
    end

    def title
        @title
    end 

    def contents
        @contents
    end 

    def count_words
        @contents.split(" ").length
    end

    def show_numbers
        result = @contents.scan(/(0[1-6][0-9]{8,10}|07[0-9]{9})/)
        result.map {|item| @phone_list << item[0]}
        return @phone_list
    end
end