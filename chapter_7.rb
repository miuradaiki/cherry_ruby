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

# クラスメソッドの定義

