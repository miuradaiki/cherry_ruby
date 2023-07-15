puts "start"

begin
  1 + "10"
rescue
  puts "例外発生したがこのまま続行"
end

puts "End"

# method_1にだけ例外処理を記述する
def method_1
  puts "method_1 start"
  begin
    method_2
  rescue
    puts "例外が発生しました"
  end
  puts "method_1 end"
end

def method_2
  puts "method_2 start"
  method_3
  puts "method_2 end"
end

def method_3
  puts "method_3 start"
  1 / 0
  puts "method_3 end"
end

# 処理を開始する
method_1

# 処理結果
# method_1 start
# method_2 start
# method_3 start
# 例外が発生しました
# method_1 end

begin
  1 / 0
  rescue => e
    puts "エラークラス：#{e.class}"
    puts "エラーメッセージ：#{e.message}"
    puts "バックトレース------------"
    puts e.backtrace
    puts "------------------------"
end

# 処理結果
# エラークラス：ZeroDivisionError
# エラーメッセージ：divided by 0
# バックトレース------------
# chapter_9.rb:45:in `/'
# chapter_9.rb:45:in `<main>'
# ------------------------

begin
  1 / 0
  rescue ZeroDivisionError
    puts "0で除算しました"
end
# ZeroDivisionErrorを捕捉した場合のみ実行される
