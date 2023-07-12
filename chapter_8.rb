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


# module_functionメソッド
# ミックスインとしてもモジュールの特異メソッドとしても使える
module Loggable
  def log text
    puts "[LOG] #{text}"
  end
  # module_functionは対象のメソッドの定義よりも下で呼び出すこと
  module_function :log
end

# モジュールの特異メソッドとしてlogメソッドを呼び出す
Loggable.log("Hello") #=>[LOG] Hello

class Product
  include Loggable

  def title
    # includeしたモジュールのlogメソッドを呼び出す
    log "title is called"
  end
end

product = Product.new
product.title #=>[LOG] title is called

# モジュールに定数を定義する
module Loggable
  PREFIX = "[LOG]"

  def log text
    puts "#{PREFIX} #{text}"
  end
end

Loggable::PREFIX #=>"[LOG]"


# 状態を保持するモジュール
module AwesomeApi
  # 設定値を保持するクラスインスタンス
  @base_url = ""
  @debug_mode = false

  # クラスインスタンス変数を読み書きするための特異メソッドを定義する
  class << self
    def base_url=(value)
      @base_url = value
    end

    def base_url
      @base_url
    end

    def debug_mode=(value)
      @debug_mode = value
    end

    def debug_mode
      @debug_mode
    end

    # 上ではわかりやすくするために明示的にメソッドで定義したが、本来は以下の１行で済む
    # attr_accessor :base_url, :debug_mode
  end
end

# 設定値を保存する
AwesomeApi.base_url = "http://example.com"
AwesomeApi.debug_mode = true

# 設定値を参照する
AwesomeApi.base_url #=>"http://example.com"
AwesomeApi.debug_mode #=>true
