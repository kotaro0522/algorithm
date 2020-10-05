n = gets.strip.to_i
b = gets.strip.split.map(&:to_i)

ans = 0

for i in 0..n-2
  ans += [b[i],b[i+1] || b[i]].min
end

p ans + b.first
