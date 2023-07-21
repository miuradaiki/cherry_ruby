# begin/endを省略するrescue修飾子
# 例外が発生しそうな処理 rescue 例外が発生した時の戻り値

# 例外が発生しない場合
p 1 / 1 rescue p 0 #=>1
p 1 / 0 rescue p 0 #=>0

require "date"

def to_date(string)
  begin
    # 文字列のパースを試みる
    Date.parse(string)
  rescue ArgumentError
    nil
  end
end

p to_date("2023-01-01") #=>#<Date: 2023-01-01 ((2459946j,0s,0n),+0s,2299161j)>
p to_date("abcdef") #=>nil

# 以上を書き換えると・・・
def to_date(string)
  Date.parse(string) rescue nil
end

# 同じ結果が得られる
p to_date("2023-01-01") #=>#<Date: 2023-01-01 ((2459946j,0s,0n),+0s,2299161j)>
p to_date("abcdef") #=>nil
