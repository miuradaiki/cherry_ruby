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

