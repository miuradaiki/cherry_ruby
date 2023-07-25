# Procオブジェクト
# Procクラスはブロック、つまり「何らかの処理（何らかの手続き）」を表す

# Procオブジェクトを作成する
hello_proc = Proc.new do
  p "hello"
end

# do endの代わりに{}を使っても良い
# hello_proc = Proc.new { "hello"}

# Procオブジェクトを実行したい場合はcallメソッドを使う
hello_proc.call #=> "hello"

add_proc = Proc.new { |a, b| a + b }
p add_proc.call(10, 20) #=>30

add_proc = Proc.new { |a = 0, b = 0| a + b}
p add_proc.call #=>0
p add_proc.call(10) #=>10
p add_proc.call(10, 20) #=>30

# Proc.newの代わりにprocメソッド使う
add_proc = proc { |a, b| a + b }


# Procオブジェクトをブロックの代わりに渡す
def greet(&block)
  puts "おはよう"
  text = block.call("こんにちは")
  puts text
  puts "こんばんは"
end

repeat_proc = Proc.new { |text| text * 2 }
greet(&repeat_proc)

# Procオブジェクトを普通の引数として渡す
# 結果は上記と同じになる
def greet(arrange_proc)
  puts "おはよう"
  text = arrange_proc.call("こんにちは")
  puts text
  puts "こんばんは"
end

repeat_proc = Proc.new { |text| text * 2 }
greet(repeat_proc)


# Proc.newとラムダの違い
# ー>構文またはlambdaメソッドでProcオブジェクトを作成する
# ->(a, b) { a + b }
# lambda { |a, b| a + b }
