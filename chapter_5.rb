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
