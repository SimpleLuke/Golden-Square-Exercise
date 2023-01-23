#File: lib/secret_diary.rb

class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @is_locked = true
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    fail "Go away!" if @is_locked
    # Returns the diary's contents if the diary is unlocked
    return @diary.read
    # The diary starts off locked
  end

  def lock
    # Locks the diary
    @is_locked = true
    # Returns nothing
  end

  def unlock
    # Unlocks the diary
    @is_locked = false
    # Returns nothing
  end
end
