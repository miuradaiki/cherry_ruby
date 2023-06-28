# ハッシュ
# ハッシュを使った繰り返し処理
currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee"}

currencies.each do |key, value|
  puts "#{key}:#{value}"
end

# シンボル
# シンボルはSymbolクラスのオブジェクト
# :apple.class => Symbol

# シンボルはRubyの内部で整数として管理されるので、２つの値が同じかどうか調べる場合は文字列よりも高速に処理ができる
"apple" == "apple"
:apple == :apple

# シンボルは「同じシンボルであれば全く同じオブジェクト」である
# そのため、「大量の同じ文字列」と「大量の同じシンボル」であれば後者の方が早い

# ハッシュで使用頻度の高いメソッド
currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee"}
currencies.keys #=> [:japan, :us, :india]
currencies.values #=> ["yen", "dollar", "rupee"]

# has_key?/key?include?/member?
currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee"}
currencies.has_key?(:japan) #=> true
currencies.has_key?(:iutaly) #=> false

# **でハッシュを展開させる
h = { us: "doller", india: "rupee"}
{ japan: "yen", **h} #=> { japan: "yen", us: "doller", india: "rupee"}

# mergeを使っても同じ結果を得ることができる
h = { us: "doller", india: "rupee"}
{ japan: "yen" }.merge(h)

# ハッシュから配列、配列からハッシュへ
currencies = { japan: "yen", us: "doller", india: "rupee"}
currencies.to_a

array = [1, 2, 3, 4]
# p array.to_h #=> ハッシュとして解析不能な場合はエラーとなる

array = [[:japan, "yen"], [:us, "doller"], [:india, "rupee"]]
# p array.to_h # => {:japan=>"yen", :us=>"doller", :india=>"rupee"}
