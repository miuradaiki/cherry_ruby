# クラスの作成を理解する

# Userクラスを定義する
class User
  attr_reader :first_name, :last_name, :age

  def initialize first_name, last_name, age
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド
  def full_name
    "#{first_name} #{last_name}"
  end
end

# ユーザーのデータを作成する
users = []
users << User.new("Alice", "Ruby", 20)
users << User.new("Bob", "Python", 30)

# ユーザーのデータを表示する
users.each do |user|
  puts "氏名: #{user.full_name}、年齢: #{user.age}"
end

# オブジェクトの作成とinitializeメソッド
# initializeメソッドは初期化時に実行したい処理を書く
# 必要なければ定義しなくてもいい
# デフォルトでprivateメソッドになっている
class User
  def initialize
    puts "Initialized."
  end
end

# インスタンスメソッド
class User
  # インスタンスメソッドの定義
  def hello
    "Hello!"
  end
end

user = User.new
# インスタンスメソッドの呼び出し
user.hello #=> "Hello!"

# インスタンス変数とアクセサメソッド
class User
  # インスタンスメソッドの定義
  def initialize name
    @name = name
  end

  def hello
    # インスタンス変数に保存されている名前を表示する
    # インスタンス変数が定義されてない場合はnilとなる
    "Hello, I am #{@name}"
  end
end

# クラスの継承
# サブクラス < スーパークラスで記述する
# class DVD < Product
# end

# superでスーパークラスのメソッドを呼び出す
class Product
  attr_reader :name, :price

  def initialize name, price
    @name = name
    @price = price
  end
end

product = Product.new("A great movie",  1000)
product.name #=> "A great movie"
product.price #=> 1000

class DVD < Product
  attr_reader :running_time

  def initialize name, price, running_time
    # スーパークラスのinitializeメソッドを呼び出す
    super(name, price)
    # DVDクラス独自の属性
    @running_time = running_time
  end
end

dvd = DVD.new("A great movie", 1000, 120)
dvd.name #=> "A great movie"
# もし引数がスーパークラスと同じだった場合は、superだけでOK

# 定数について
class Product
  DEFAULT_PRICE = 0
end

Product::DEFAULT_PRICE #=> 0

# privateにする
class Product
  DEFAULT_PRICE = 0
  # 定数をprivateにする
  private_constant :DEFAULT_PRICE
end

# privateなのでクラスの外部からは参照できない
Product::DEFAULT_PRICE #=> NameErrorとなる
