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
