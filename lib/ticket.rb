class Ticket
  attr_reader :fare, :stamped_at

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    # 入場した駅名を格納
    @stamped_at = name
  end
end
