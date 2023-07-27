# パターンマッチの基本
require = "date"

records = [
  [2021],
  [2019, 5],
  [2017, 11, 5]
]

# [2021]のように配列の要素が1つだけの場合はその年の1月1日を、
# 要素が2つの場合はその年月の1日を、
# 要素が3つある場合は年月日をDateオブジェクトに変換して新しい配列を返す処理を考える

# パターンマッチを使用
records.map do |records|
  case record
  in[y]
    Date.new(y, 1, 1)
  in[y, m]
    Date.new(y, m, 1)
  in[y, m, d]
    Date.new(y, m, d)
end
