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

# Procオブジェクトを実行するさまざまな方法
add_proc = Proc.new { | a, b | a + b }

# callメソッドを使う
add_proc.call(10, 20) #=>30

# yieldメソッドを使う
add_proc.yield(10, 20) #=>30

# .()を使う
add_proc.(10, 20) #=>30

# []を使う
add_proc[10, 20] #=>30

# ===を使って呼び出す
# これで呼び出せる理由としては、case文のwhen節で使えるようにするため
add_proc === [10, 20] #=>30

# 上の例
def judge age
  # 20より大きければtrueを返すProcオブジェクト
  adult = Proc.new { |n| n > 20}
  # 20より小さければtrueを返すProcオブジェクト
  child = Proc.new { |n| n < 20}
end

case age
when adult
  "大人です"
when child
  "子供です"
else
  "はたちです"
end

judge(25) #=>"大人です"
judge(18) #=>"子供です"
judge(20) #=>"はたちです"

# &とto_procメソッド
reverse_proc = Proc.new { |s| s.reverse }
# mapメソッドにブロックを渡す代わりに、Procオブジェクトを渡す（ただし＆が必要）
["Ruby", "Java", "Python"].map(&reverse_proc)
