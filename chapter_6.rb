# 正規表現
# https://rubular.com/

if "123-4567" =~ /\d{3}-\d{4}/
  puts "マッチしました"
else
  puts "マッチしませんでした"
end

# !~ マッチしなかった時にtrueを返す
"hello" !~ /\d{3}-\d{4}/ #=>true

# 正規表現のキャプチャを利用する
text = "私の誕生日は1997年1月4日です。"
m = /(\d+)年(\d+)月(\d+)日/.match(text)
m[0] #=>"1997年1月4日"
m[1] #=>"1997"
m[2] #=>"1"
m[3] #=>"4"
m[1..3] #=>["1997", "1", "4"]

# 以下のように入れ替えても動作する
m = text.match(/(\d+)年(\d+)月(\d+)日/)
# => #<MatchData "1997年1月4日" 1:"1997" 2:"1" 3:"4">

# キャプチャに名前をつける
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/
# m[:year]のようにシンボルで名前を指定して呼び出すことができる

# =~演算子を使うと、キャプチャの名前をそのままローカル変数として使用できるようになる
# ただし正規表現リテラルを直接左辺に置く必要がある
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~text
  puts "#{year}/#{month}/#{day}"
end

# scan
# 引数に渡した正規表現にマッチする部分を配列に入れて返す
"123 456 789".scan(/\d+/) #=> ["123", "456", "789"]

# [], slice, slice!
# []に正規表現を渡すと、文字列から正規表現にマッチするものを抜き出してくる
# 複数マッチする場合は最初にマッチしたもののみ返ってくる
text = "郵便番号123-4567です"
text[/\d{3}-\d{4}/] #=> "123-4567"

# sliceは[]のエイリアスメソッド
text.slice(/\d{3}-\d{4}/) #=> "123-4567"

# 第二引数で数字を指定すると何番目のキャプチャを取得するか指定できる
text = "私の誕生日は1997年1月4日です。"
text.slice(/(\d+)年(\d+)月(\d+)日/, 3) #=>4

# gsub, gsub!
# 第一引数の正規表現にマッチした文字列を第二引数の文字列で置き換える
text = "123,456-789"

text.gsub(",", ":") #=>"123:456-789"

# 正規表現オブジェクトを作成する様々な方法
Regexp.new('\d{3}-\d{4}') #=>/\d{3}-\d{4}/

# スラッシュで囲むと、スラッシュをエスケープする必要がある
/https:\/\/example\.com/

# %r!を使うとエスケープしなくていい
%r!https://example\.com! #=>/https:\/\/example\.com/

# !ではなく{}を区切り文字にする
%r{https://example\.com}
