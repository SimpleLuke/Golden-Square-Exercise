class Diary
    def initialize
        @entries_list = []
        @tasks_list = []
    end

    def add(page)
        if page.instance_of?(ToDo)
            @tasks_list.push(page)
        else
            @entries_list.push(page)
        end
    end

    def all_titles
        if @entries_list.empty?
            return 'You have no entries currently.'
        else
            return @entries_list
        end
    end

    def read_entry(title)
        @entries_list.each do |entry|
            if entry.title == title
                return entry.contents
            end
        end
        fail 'This entry does not exist.'
    end

    def show_tasks
        @tasks_list.select {|task| task.is_done? == false}
    end

    def find_best_entry(wpm, minutes)
        max_words = wpm * minutes
        eligible = []
        @entries_list.each {
            |entry|
            if entry.count_words > max_words
                next
            else
                eligible.push(entry)
            end
        }
        eligible.sort_by{
            |entry|
            entry.count_words
        }[-1]
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
        # Returns an instance of diary entry representing the entry that is closest 
        # to, but not over, the length that the user could read in the minutes they
        # have available given their reading speed.
    end

    def show_all_numbers
        all_phone_list = []
        @entries_list.each do |entry|
            all_phone_list << entry.show_numbers
        end

        all_phone_list.select {|item| item.length > 0}

        # all_numbers = []
        # @entries_list.each { # entry1, 5, 6
        #     |entry|
        #     puts entry.show_numbers.length
        #     if entry.show_numbers.length > 0
        #         all_numbers.push(entry.show_numbers.length)
        #         puts entry.show_numbers.length
        #         puts "#{entry.show_numbers}"
        #     end
        # }
        # all_numbers

        # all_numbers = @entries_list.map { # entry1, 5, 6
        #     |entry|
        #     entry.show_numbers if !entry.show_numbers.empty?
        # }

        
        
        # all_numbers = all_numbers.filter{
        #     |array|
        #     !array.empty?
        # }
        # all_numbers
    end
    
end