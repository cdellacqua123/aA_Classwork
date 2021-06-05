require "byebug"
#Phase 1

# def first_anagram(word1, word2)
#     arr = word1.split("").permutation.to_a
#     p arr.length
#     arr.each do |sub_arr|
#         return true if word2 == sub_arr.join
#     end

#     false


# end

# p  first_anagram("craps", "car")

#This is O(n!)


#Phase 2

def second_anagram?(word1, word2)
  return true if (word1.empty?) && (word2.empty?)
  return false if ((word1.empty?) && (!word2.empty?)) || ((!word1.empty?) && (word2.empty?)) 
  letter_1 = word1[0]
  letter_1_idx = word2.index(letter_1)    

  return false if (letter_1_idx.nil?)
  word1 = word1.delete(letter_1)
  word2 = word2.delete(word2[letter_1_idx])
  second_anagram?(word1, word2)

end

p  second_anagram?("tarc", "cart")

# This should be O(n log n)



  

