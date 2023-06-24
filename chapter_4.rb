# 配列
a = [1, 2, 3]
a << 4 # 最後に要素を追加できる
# puts a

# 特定の位置にある要素を削除する
a.delete_at(3)
# puts a

# 配列を使った多重代入
c, d = [1, 2]
# c = 1, d = 2

# ブロック
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
# ブロックの範囲はdo〜endまで

a = [1, 2, 3, 1, 2, 3]
# a.delete(2) # 一致するものを削除＝２を削除
# a=> 1, 3, 1, 3

a.delete_if do |n|
  n.odd?
end
# a=> 2, 2

# do〜endと{}
numbers = [1, 2, 3, 4]
sum = 0
# do〜endのかわりに{}を使う
numbers.each { |n| sum += n }

# mapとcollect
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10 }
# puts new_numbers => 10, 20, 30, 40, 50

new_numbers = numbers.map { |n| n * 10 }
# puts new_numbers => 10, 20, 30, 40, 50

# &:で簡略化も可能
["ruby", "java", "python"].map { |s| s.upcase }
# => ["RUBY", "JAVA", "PYTHON"]
["ruby", "java", "python"].map(&:upcase)
# => ["RUBY", "JAVA", "PYTHON"]
# 注意）ただし、次の条件の時のみ使用可能
# １：ブロックパラメータが１つだけの時
# ２：ブロックの中で呼び出すメソッドには引数がない
# ３：ブロックの中では、ブロックパラメータに対してメソッドを1回呼び出す以外の処理がない

# 配列の和集合、差集合、積集合
a = [1, 2, 3]
b = [3, 4, 5]
# 和集合
#  a | b => [1, 2, 3, 4, 5]
# 差集合
# a - b => [1, 2]
# 積集合
# a & b => [3]
