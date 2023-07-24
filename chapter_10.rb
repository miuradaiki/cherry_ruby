class WordSynth
  def initialize
    @effects = []
  end

  def add_effect effect
    @effects << effect
  end

  def play original_words
    words = original_words
    @effects.each do |effect|
      # 効果を適用する
      words = effect.call(words)
    end
    words
  end
end

# yieldをProcを理解する
def greet
  puts "おはよう"
  if block_given?
    yield
  end
  puts "こんばんは"
end

greet do
  puts "こんにちは"
end

# yieldはブロックに引数を渡したり、ブロックの戻り値を受け取ったりできる

# ブロックを引数として明示的に受け取る
# 引数の前に&をつけ、ブロックを実行する時はcallメソッドを使う
def greet(&block)
  puts "おはよう"
  text = block.call("こんにちは")
  puts text
  puts "こんばんは"
end

greet do |text|
  text * 2
end

# 日本語版と英語版のgreetメソッドを用意、共通処理化する
def greet_ja(&block)
  texts = ["おはよう", "こんにちは", "こんばんは"]
  # ブロックを別のメソッドに引き渡す
  greet_common(texts, &block)
end

def greet_en(&block)
  texts = ["good morning","hello", "good evening"]
  # ブロックを別のメソッドに引き渡す
  greet_common(texts, &block)
end

# 出力処理用の共通メソッド
def greet_common(texts, &block)
  puts texts[0]
  # ブロックを実行する
  puts block.call(texts[1])
  puts texts[2]
end

# 日本語版のgreetメソッドを呼び出す
greet_ja do |text|
  text * 2
end
#=> おはよう
#=> こんにちはこんにちは
#=> こんばんは

# 英語版のgreetメソッドを呼び出す
greet_en do |text|
  text.upcase
end
#=> good morning
#=> HELLO
#=> good evening
