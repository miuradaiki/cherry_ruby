class Product
  # クラスインスタンス変数
  @name = name

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name
  end

  def name
    # インスタンス変数
    @name
  end
end

# p Product.name #=>"Product"
# product = Product.new("A great movie")
# p product.name #=>"A great movie"
# p Product.name #=>"Product"

# インスタンス変数はクラスをインスタンス化した時にオブジェクトごとに管理される変数
# クラスインスタンス変数はインスタンスの作成とは無関係にクラス自身が保持しているデータ（クラス自身のインスタンス変数）

class DVD < Product
  @name = "DVD"

  def self.name
    # クラスインスタンス変数を参照
    @name
  end

  def upcase_name
    # インスタンス変数を参照
    @name.upcase
  end
end

p Product.name #=>"Product"
p DVD.name  #=>"DVD"

product = Product.new("A great movie")
p product.name #=> "A great movie"

dvd = DVD.new("An awsome film")
p dvd.name #=> "An awsome film"
p dvd.upcase_name #=>"AN AWSOME FILM"

p Product.name #=>"Product"
p DVD.name  #=>"DVD"
