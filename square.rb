class Square
  def initialize
    @owner = false
  end
  
  public
  def owner=(player)
    @owner = player
  end

  def to_s
    self.is_owned? ? @owner.symbol : " "
  end

  def is_owned?
    @owner ? true : false
  end

end