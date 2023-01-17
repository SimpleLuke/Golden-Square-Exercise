def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    if cipher.find_index(char)
        (65 + cipher.find_index(char)).chr
    else 
        'Z'
    end
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
#   print cipher
  plaintext_chars = ciphertext.chars.map do |char|
    if char.ord - 65 >= 25
        'z'
    else    
        cipher[char.ord - 65]
    end
  end
#   print plaintext_chars
  return plaintext_chars.join
end

print encode("theswiftfoxjumpedoverthelazydog", "secretkey") == "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
puts 
print decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey") == "theswiftfoxjumpedoverthelazydog"



# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"