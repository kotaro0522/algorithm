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

def swap(arr, first_index, second_index)
  arr[first_index], arr[second_index] = arr[second_index], arr[first_index]
end

def checker(arr, first_index, pivot_index)
  return 0, 0 if first_index == pivot_index

  pivot = arr[pivot_index]

  greater_index = -1
  (first_index..pivot_index).each do |i|
    if arr[i] > pivot
      greater_index = i
      break
    end
  end

  lesser_index = -1
  pivot_index.downto(first_index).each do |i|
    if arr[i] < pivot
      lesser_index = i
      break
    end
  end

  lesser_index = pivot_index if greater_index > lesser_index
  greater_index, lesser_index = checker(arr, first_index, pivot_index - 1) if greater_index < 0

  [greater_index, lesser_index]
end

def switcher(arr, first_index, pivot_index)
  if pivot_index - first_index == 1
    swap(arr, first_index, pivot_index) if arr[pivot_index] < arr[first_index]
    return
  end

  greater_index, lesser_index = checker(arr, first_index, pivot_index)
  return if greater_index.zero? && lesser_index.zero?

  swap(arr, greater_index, lesser_index)

  return greater_index if lesser_index == pivot_index
  switcher(arr, first_index, pivot_index)
end

def quick_sort(arr, first_index, last_index)
  return if first_index >= last_index

  pivot_index = switcher(arr, first_index, last_index)
  return if pivot_index.nil?

  quick_sort(arr, first_index, pivot_index - 1) if pivot_index > 0
  quick_sort(arr, pivot_index + 1, last_index)
end

# arr = [38, 27, 43, 3, 9, 82, 10]
# arr = [2,1,3,10,9,5,4]
# arr = [2,1,3]
# arr = [1,2,3]
# arr = [3,1,2]
# arr = [3,2,1]
# arr = [1,3,2]
# arr = [2,3,1]
# arr = [2,1]
# arr = [1,2]
# arr = [1]

# arr = [9, 10, 4, 8, 7, 5, 1, 2, 3, 6]

# arr = (1..10).to_a.shuffle
arr = [48, 83, 86, 43, 4, 55, 84, 76, 59, 90, 77, 63, 49, 17, 8, 33, 70, 88, 40, 58, 19, 81, 97, 91, 13, 68, 46, 89, 51, 24, 20, 25, 64, 96, 26, 50, 39, 93, 27, 23, 10, 38, 67, 14, 95, 78, 16, 2, 85, 87, 74, 18, 52, 56, 12, 31, 36, 66, 73, 15, 35, 71, 100, 37, 92, 7, 1, 21, 69, 80, 94, 34, 5, 60, 28, 6, 82, 29, 41, 45, 79, 44, 54, 75, 22, 57, 72, 53, 3, 61, 9, 30, 42, 62, 47, 98, 32, 65, 99, 11]

result = Benchmark.realtime do
  ans = arr.sort
  p "ruby's sort"
  # p ans
end
p result

result2 = Benchmark.realtime do
  ans = merge_sort(arr)
  p 'original merge sort'
  # p ans
end
p result2

result3 = Benchmark.realtime do
  quick_sort(arr, 0, arr.size-1)
  p 'original quick sort'
  # p arr
end
p result3
