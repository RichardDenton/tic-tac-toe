class Game
  @@player_number = 1
  @@used_symbol = nil
  attr_reader :board

  def initialize
    system("clear")
    @player1 = create_player
    @player2 = create_player
    @board = Board.new(@player1, @player2)
  end

  private
  def create_player
    puts "Enter the name of player #{@@player_number.to_s}:"
    player_name = gets.chomp
    player_symbol = ''
    until player_symbol.length == 1 && player_symbol != @@used_symbol
      puts "Enter the symbol for #{player_name}, must be exactly one character long:"
      player_symbol = gets.chomp
      puts "Cannot use the same symbol as #{@player1.name}" if player_symbol == @@used_symbol
    end
    @@player_number += 1
    @@used_symbol = player_symbol
    puts
    Player.new(player_name, player_symbol)
  end
end