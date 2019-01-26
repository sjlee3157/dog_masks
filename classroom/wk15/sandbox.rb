require "pry"

def reverse_string_in_place(string)
  return nil if !string
  raise ArgumentError if string.class != String

  n = string.length
  i = 0
  j = n-1
  while i < j

    placeholder = string[j]
    string[j] = string[i]
    string[i] = placeholder

    i += 1
    j -= 1
  end
  return string
end

p reverse_string_in_place("the eagle has landed")

def reverse_words(message)
  return nil if !message
  raise ArgumentError if message.class != String

  message = reverse_string_in_place(message)

  i = 0
  while i < (message.length - 1)

    until message[i] != " " || i == (message.length - 1)
      i += 1
    end
    j = i
    until message[j + 1] == " " || j == (message.length - 1)
      j += 1
    end

    message[i..j] = reverse_string_in_place(message[i..j])
    i = j+1 #first space after letter
  end

  return message
end

p reverse_words("get des cookies baby!")
