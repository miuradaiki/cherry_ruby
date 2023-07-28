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

# ハッシュをパターンマッチさせる
cars = [
  {name: "The Beatle", engine: "105ps"},
  {name: "Prius", engine: "98ps", motor: "72ps"},
  {name: "Tesla", motor: "306ps"},
]

# パターンマッチを使わない場合
cars.each do |car|
  if car.key?(:engine) && car.key?(:motor)
    puts "Hybrid: #{car[:name]} / engine: #{car[:engine]} / motor: #{car[:motor]}"
  elsif car.key?(:engine)
    puts "Hybrid: #{car[:name]} / engine: #{car[:engine]}"
  elsif car.key?(:motor)
    puts "Hybrid: #{car[:name]} / motor: #{car[:motor]}"
  end
end

# パターンマッチを使った場合
cars.each do |car|
  case car
  in {name:, engine:, motor:}
    puts "Hybrid: #{car[:name]} / engine: #{car[:engine]} / motor: #{car[:motor]}"
  in {name:, engine:}
    puts "Hybrid: #{car[:name]} / engine: #{car[:engine]}"
  in {name:, motor:}
    puts "Hybrid: #{car[:name]} / motor: #{car[:motor]}"
  end
end

# パターンマッチの利用パターン
# valueパターン
country = "italy"

message =
  case country
    in "japan"
      "こんにちは"
    in "us"
      "Hello"
    in "italy"
      "Ciao"
  end
# message => "Ciao"
