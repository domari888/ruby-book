class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [160, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    # Ticket クラスのインスタンスに入場した駅名を渡す
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    # index()メソッドで引数に渡した駅名の要素のインデックスを取得
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)

    # 乗降車区間の駅数を取得
    distance = to - from
    # 運賃の配列から料金を取得
    FARES[distance - 1]
  end
end
