# 多重代入
a, b = 1, 2
# a = 1, b = 2

# 右辺の数が少ない時はnilが入る
c, d = 10
# c = 10, d = nil

# 右辺の数が多い場合ははみ出した値が切り捨てられる
e, f = 100, 200, 300
# e = 100, f = 200

# アンダースコアで始まる/アンスコのみの変数について
# 宣言するが使わない、という意味を持たせてあえてそうする場合もある
first_name, _last_name = "Daiki Miura".split(" ")
# first_name = "Daiki"

# 参照の概念
# ＝を複数回使って２個以上の変数に同じ値を代入することもできる
a = b = "hello"
a.upcase!
# aもbも"HELLO"となる

# 数値
num = 1_000_000_000
# この時_は無視されて1000000000と出力される
# 大きな数の区切り文字として_が便利

# 変数に格納された数値の増減
# ++や--のような演算子がなく、代わりに+=や-=を使う
n = 2
n += 2 # 2 + 2 = 4
n -= 2 # 4 - 2 = 2
n *= 2 # 2 * 2 = 4
n /= 2 # 4 / 2 = 2

# if文
# if文の結果は戻り値を返す
# =ifの結果を変数に代入することができる
country = "Japan"
greeting =
  if country == "Japan"
    "Tokyo"
  elsif country == "America"
    "Washington, D.C."
  elsif country == "China"
    "Beijing"
  end
# https://tdak.hateblo.jp/entry/20210125/1611579095
# 三項演算子使ったり、メソッド切り出したりする方が良さそう（個人的偏見）

