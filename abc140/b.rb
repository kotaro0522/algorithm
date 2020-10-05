n = gets.strip.to_i
a = gets.strip.split.map(&:to_i)
b = gets.strip.split.map(&:to_i)
c = gets.strip.split.map(&:to_i)

ans = 0
previous_one = -1

a.each do |i|
  ans += b[i-1]
  ans += c[i-2] if previous_one == i - 1
  previous_one = i
end

p ans
