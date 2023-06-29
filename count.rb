def count_pattern(string, pattern)
  count = 0
  start_index = 0

  while start_index = string.index(pattern, start_index)
    count += 1
    start_index += pattern.length
  end

  count
end

# 使用例
string = "Hello. Hello. Goodbye."
pattern = "."
puts count_pattern(string, pattern)
