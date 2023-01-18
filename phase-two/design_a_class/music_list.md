# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class MusicList
    def initialize
        #...
    end

    def add_muisc(track) # track is a string presenting the music they have listened
        # return an updated list as an array representing the music they've listened so far.
    end

    def music_listened_list #no argument
        #return a music list as an array representing the song they've listened so far.
    end
end

```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

#1
music_list = MusicList.new
music_list.add_music('') #=> []

# 2
music_list = MusicList.new
music_list.add_music('Happy Birthday') #=> ['Happy Birthday']

# 3
music_list = MusicList.new
music_list.music_listened_list # => []

# 4
music_list = MusicList.new
music_list.add_music('Happy Birthday')
music_list.add_music('Merry Christmas')
music_list.music_listened_list #=> ['Happy Birthday','Merry Christmas']


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
