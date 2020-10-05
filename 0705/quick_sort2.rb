require 'benchmark'

def swap(arr, first_index, second_index)
  first_element = arr[first_index]
  second_element = arr[second_index]
  arr[first_index] = second_element
  arr[second_index] = first_element
  arr
end

def checker(arr)
  return [0, 0, 1] if arr.size == 1

  pivot = arr.last

  greater_index = -1
  arr.each.with_index do |v, i|
    if v > pivot
      greater_index = i
      break
    end
  end

  lesser_index = -1
  arr.reverse_each.with_index do |v, i|
    if v < pivot
      lesser_index = arr.size - i - 1
      break
    end
  end

  indexes_without_pivot = 0..(arr.size - 2)

  lesser_index = arr.size - 1 if greater_index > lesser_index
  result = [greater_index, lesser_index, arr.size]
  result = checker(arr[indexes_without_pivot]) if greater_index < 0

  result
end

def switcher(arr)
  if arr.size == 2
    return [[arr[0]], []] if arr[0] < arr[1]
    return [[], [arr[0]]] if arr[1] < arr[0]
  end

  greater_index, lesser_index, arr_size = checker(arr)

  new_arr = swap(arr, greater_index, lesser_index)

  pivot_index = arr.size - 1
  indexes_without_pivot = 0..(arr.size - 2)
  last_index = -1

  return [new_arr[indexes_without_pivot], []] if arr_size < 3
  return [[], new_arr[1..last_index]] if lesser_index == pivot_index && greater_index.zero?
  return [new_arr[0..(greater_index - 1)], new_arr[(greater_index + 1)..last_index]] if lesser_index == pivot_index
  switcher(new_arr)
end

# p switcher(arr)

def quick_sort(arr)
  return arr if arr.size < 2
  pivot = arr.last

  left_partition, right_partition = switcher(arr)

  sorted_left_partition = quick_sort(left_partition)
  sorted_right_partition = quick_sort(right_partition)
  sorted_left_partition + [pivot] + sorted_right_partition
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

arr = (1..1000).to_a.shuffle

result = Benchmark.realtime do
  ans = quick_sort(arr)
  p 'original quick sort'
  # p ans
end
p result

# result2 = Benchmark.realtime do
#   ans = arr.sort
#   p "ruby's sort"
#   # p ans
# end
# p result2
