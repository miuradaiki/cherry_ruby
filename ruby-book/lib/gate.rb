class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [160, 190]

  def initialize name
    @name = name
  end

  def enter ticket
    ticket.stamp(@name)
  end

  def exit ticket
    true
  end

  def calc_fare ticket
    # indexメソッドは配列の中から引数に一致する要素の添え字を取得する
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to -from
    FARES[distance - 1]
  end
end