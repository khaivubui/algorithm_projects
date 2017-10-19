require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  counter_hash = Hash.new(0)
  string.chars do |ch|
    counter_hash[ch] += 1
  end

  counter_hash.values.count(&:odd?) <= 1
end
