require 'byebug'

def anagrams_1(str1, str2)
  all_anagrams = []

  str1_perms = permutations(str1.split(""))
  str1_perms.each do |str|
    all_anagrams << str.join("")
  end

  all_anagrams.include?(str2)
end

def permutations(arr)
  return [[]] if arr.empty?

  prev_perms = permutations(arr[0...-1])
  new_perms = []
  prev_perms.each do |perm|
    (0..perm.length).each do |idx|
      new_perms << perm.dup.insert(idx,arr.last)
    end
  end
  new_perms

end

def anagrams_2(str1, str2)
  str1.split("").each do |letter|
    if str2.split("").include?(letter)
      str1.delete!(letter)
      str2.delete!(letter)
    end
  end

  return true if str1.length == 0 && str2.length == 0
  false
end

def anagrams_3(str1, str2)
  str1.split("").sort ==  str2.split("").sort
end

def anagrams_4(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |letter|
    hash1[letter] += 1
  end

  str2.each_char do |letter|
    hash2[letter] += 1
  end

  hash1 == hash2
end

def anagrams_5(str1, str2)
  hash = Hash.new(0)

  str1.each_char do |letter|
    hash[letter] += 1
  end

  str2.each_char do |letter|
    hash[letter] -= 1
  end

  hash.values.all? {|el| el == 0}
end
