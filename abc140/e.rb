n = gets.strip.to_i
p = gets.strip.split.map(&:to_i)
ans = 0

for l in 1..(n-1)
  x = p[l-1]
  y = -1
  for r in (l+1)..n
    y = [x, y, p[r-1]].sort[1]
    x = [x, y, p[r-1]].max
    ans += y
  end
end

p ans
