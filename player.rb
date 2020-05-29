class Player
  attr_reader :name, :symbol

  @@taken_symbols = []

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @@taken_symbols.push(symbol)
  end

  def self.taken_symbols
    @@taken_symbols
  end
end