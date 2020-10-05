n, k = gets.strip.split.map(&:to_i)
a = []
n.times do
  a << gets.strip.to_i
end

shift = n - k
shift_times = 0

a.sort!

(0..shift-1).each do |i|
  shift_times += a[i]
end

not_shift_times = 0

(shift..n-1).each do |i|
  not_shift_times += a[i]
end

p shift_times*2 + not_shift_times
