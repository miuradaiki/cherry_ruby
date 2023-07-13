# メソッド探索について
module A
  def to_s
    "<A> #{super}"
  end
end

module B
  def to_s
    "<B> #{super}"
  end
end

class Product
  def to_s
    "<Product> #{super}"
  end
end

class DVD < Product
  include A
  include B

  def to_s
    "<DVD> #{super}"
  end
end

dvd = DVD.new
dvd.to_s #=> "<DVD> <B> <A> <Product> #<DVD:0x000000011f8c43b0>"

# 呼び出し順
# DVDクラス自身のto_sメソッド
# モジュールBのto_sメソッド
# モジュールAのto_sメソッド
# スータークラスであるProductクラスのto_sメソッド
# Productクラスのスーパークラスのto_sメソッド

# 以下でもクラスやモジュールがどの順番でメソッド検索されるか確認可能
p DVD.ancestors #=>[DVD, B, A, Product, Object, Kernel, BasicObject]
