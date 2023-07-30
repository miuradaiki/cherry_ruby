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

# パターンが１つもマッチしない場合はエラー（例外）が発生する
# エラーを発生させたくない場合はelse節を使う
country = "india"

case country
  in "japan"
    "こんにちは"
  in "us"
    "Hello"
  in "italy"
    "Ciao"
  else
    "Unknown"
end
#=> "Unknown"

# else節でraiseする
country = "india"

case country
  in "japan"
    "こんにちは"
  in "us"
    "Hello"
  in "italy"
    "Ciao"
  else
    raise "無名な国名です。#{country}"
end


# variableパターン
# in節のパターンに変数を書いてローカル変数の宣言と代入を同時に行う利用パターン
# 文字列、数値、配列などマッチする

# 文字列のマッチ例
case "Alice"
in obj
  "obj=#{obj}"
end
#=> "obj=Alice"


# arrayパターン
case [1, 2, 3]
in [a, b, c]
  # 配列の要素が3つであればマッチし、尚且つ対応する要素が変数a,b,cに代入される
  "a=#{a}, b=#{b}, c=#{c}"
end
# => "a=1, b=2, c=3"

# _で任意の要素を表現することができる。例外的に2回以上使うことができる。
case [1, 2, 3]
in [_, _, 3]
  "matched"
end

# in節で*を使うと任意の長さの要素を指定したことになる
case [1, 2, 3, 4, 5]
in [1, *rest]
# 最初の要素が1であればマッチ
  "matched"
end

# *を使いたいが変数には入れなくて良いという場合
case [1, 2, 3, 4, 5]
in [1, *]
  "matched"
end
# *をなくしてカンマで終わらせても同じ意味となる
case [1, 2, 3, 4, 5]
in [1, ]
  "matched"
end

# hashパターン
case {name: "Alice", age: 20}
in {name: name, age: age}
  "name~#{name}, age=#{age}"
end

# 値の変数は省略可能
# keyの順番はマッチの結果には影響しない
case {name: "Alice", age: 20}
in {name: , age: } # {age:, name:}でもマッチする
  "name~#{name}, age=#{age}"
end

case {name: "Alice", age: 20, gender: :female}
in {name: "Alice", age: 18.., gender:}
  # :nameの値が"Alice"、:ageの値が18以上かつキーに:genderが含まれればマッチ
  "gender=#{gender}"
end
#=> "gender=female"
