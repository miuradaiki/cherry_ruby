class Ticket
  # fareとstamped_atが外部から取得できるようにゲッターメソッドを追加
  attr_reader :fare, :stamp_at
  def initialize fare
    @fare = fare
  end

  def stamp name
    @stamp_at = name
  end
end
