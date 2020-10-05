require 'benchmark'

def half_slice(arr)
  half = (arr.size / 2) - 1 + (arr.size % 2)

  [arr[0..half], arr[(half + 1)..(arr.size - 1)]]
end

def merge_sort(arr)
  return arr if arr.size == 1

  first_half, second_half = half_slice(arr)

  sorted_first_half = merge_sort(first_half) unless first_half.empty?
  sorted_second_half = merge_sort(second_half) unless second_half.empty?

  return sorted_first_half if !sorted_first_half.nil? && sorted_second_half.nil?
  return sorted_second_half if !sorted_second_half.nil? && sorted_first_half.nil?

  result = []
  until sorted_first_half.empty? || sorted_second_half.empty?
    result << sorted_first_half.shift if sorted_first_half[0] < sorted_second_half[0]
    result << sorted_second_half.shift if !sorted_first_half.empty? && !sorted_second_half.empty? && sorted_second_half[0] < sorted_first_half[0]
  end
  result << sorted_first_half.shift until sorted_first_half.empty?
  result << sorted_second_half.shift until sorted_second_half.empty?
  result
end

# arr = [38, 27, 43, 3, 9, 82, 10]
# arr = (1..10000).to_a.shuffle
arr = [48, 83, 86, 43, 4, 55, 84, 76, 59, 90, 77, 63, 49, 17, 8, 33, 70, 88, 40, 58, 19, 81, 97, 91, 13, 68, 46, 89, 51, 24, 20, 25, 64, 96, 26, 50, 39, 93, 27, 23, 10, 38, 67, 14, 95, 78, 16, 2, 85, 87, 74, 18, 52, 56, 12, 31, 36, 66, 73, 15, 35, 71, 100, 37, 92, 7, 1, 21, 69, 80, 94, 34, 5, 60, 28, 6, 82, 29, 41, 45, 79, 44, 54, 75, 22, 57, 72, 53, 3, 61, 9, 30, 42, 62, 47, 98, 32, 65, 99, 11]


result = Benchmark.realtime do
  ans = merge_sort(arr)
  p 'original merge sort'
  # p ans
end
p result

result2 = Benchmark.realtime do
  ans = arr.sort
  p "ruby's sort"
  # p ans
end
p result2
