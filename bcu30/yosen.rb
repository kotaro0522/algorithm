n, p = gets.strip.split.map(&:to_i)
a = gets.strip.split.map(&:to_i)
number = 0

a.each do |i|
  p -= i
  number += 1 if p >= 0
  break if p < 0
end

p number
