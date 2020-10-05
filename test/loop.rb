require 'benchmark'

result = Benchmark.realtime do
  end_num = 1_000_000_000
  step_size = 1
  1.step(end_num, step_size) do |i|
    hoge = (i + step_size - 1) < end_num ? (i + step_size - 1) : end_num
  end
end
p result

result2 = Benchmark.realtime do
  end_num = 1_000_000_000
  step_size = 1
  1.step(end_num, step_size) do |i|
    tmp = (i + step_size - 1)
    fuga = tmp < end_num ? tmp : end_num
  end
end
p result2
