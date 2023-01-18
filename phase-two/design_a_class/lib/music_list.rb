class MusicList
    def initialize
        @listened_list = []
    end

    def add_music(track)
        if track != ''
            @listened_list.push(track)
        end    
        @listened_list
    end

    def music_listened_list
        @listened_list
    end
end