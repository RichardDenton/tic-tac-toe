class Square
  attr_reader :owner
  
  def initialize
    @owner = false
  end
  
  public
  def owner=(player)
    @owner = player
  end

  def mark_square(player)
    unless is_owned?
      @owner = player
      return true
    else
      return false
    end
  end

  def to_s
    self.is_owned? ? @owner.symbol : " "
  end

  def is_owned?
    @owner ? true : false
  end
end