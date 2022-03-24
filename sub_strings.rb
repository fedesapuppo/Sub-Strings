# Sub Strings

# examples

# > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

# > substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

# type

# mothod wich takes a string and an array as parameters, and returns a hash

# header

# substrings(string, words_array)

# description

# takes a string and an array of words, search for words in string into the words_array. Returns a hash containing key-value pairs in wich each word fund is a key and its corresponding value is the number of times such word has been fund.

# body

def substrings(string, words_array)
words_to_find = clean_string(string)
found_words = []

words_to_find.each do |word|
  found_words += find_words(word, words_array)
end
  
unordered_hash = found_words.to_h do |word| 
  [word, found_words.count(word)] 
end

ordered_hash = unordered_hash.sort_by { |key| key }.to_h
  
end

# find words in each word to find and pushes them into "found_words" array
def find_words(string, words_array)
  found_words = []
    words_array.each do |word| 
      if string.include? word
        found_words.push word
      end
    end
  found_words
end

# removes punctuation from string and turns into an array of words to find substrings into

def clean_string(string)
  words_to_find = string.downcase.split(/\W+/)
end

# test

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# works properly when only one word is given as parameter
p substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

# works properly when a string of multiple words is given as parameter
p substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }