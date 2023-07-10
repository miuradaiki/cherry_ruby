module Loggable
  # 特にpublicにする必要がなければprivateにしておく
  private

  def log text
    puts "[LOG] #{text}"
  end
end


class Product
  include Loggable

  def title
    # logメソッドはLoggableモジュールで定義したメソッド
    log "title is called"
    "A great movie"
  end
end

class User
  include Loggable

  def name
    # Loggableモジュールのメソッドが使える
    log "name is called"
    "Alice"
  end
end

product = Product.new
product.title

user = User.new
user.name

# このようにモジュールをクラスにincludeして機能を追加することをミックスインと呼ぶ

# includeしたモジュールの有無を確認する
Product.include?(Loggable) #=> true
Product.included_modules #=> [Loggable, Kernel]

# ancestorsを使うとモジュールだけでなくスーパークラスの情報も取得できる
Product.ancestors #=> [Product, Loggable, Object, Kernel, BasicObject]

# クラスオブジェクトだけでなく、インスタンスからも上記は取得できる
product = Product.new
product.class #=>Productクラスを返す

product.class.include?(Loggable) #=> true
product.class.included_modules #=> [Loggable, Kernel]


# Kernelモジュール
# puts p pp print require loopなど

# ObjectクラスがKernelモジュールをincludeしているため上記メソッドがどこでも使える
Object.include?(Kernel) #=> true

# トップレベルではmainという名前のオブジェクト
self #=>main
self.class #=>Object

# クラス以外のオブジェクトにextendする
module Loggable
  def log text
    puts "[LOG] #{text}"
  end
end
s = "abc"
# p s.log("Hello") #=>undefined method `log' for "abc":String (NoMethodError)
s.extend Loggable
s.log("Hello") #=>[LOG] Hello
