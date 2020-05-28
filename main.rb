require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'square'

def create_player(player_number, player1_symbol = nil)
  puts "Enter the name of player #{player_number.to_s}:"
  player_name = gets.chomp
  player_symbol = ''

  until player_symbol.length == 1 && player_symbol != player1_symbol
    puts "Enter the symbol for #{player_name}, must be exactly one character long:"
    player_symbol = gets.chomp
    puts "Cannot use the same symbol as player 1" if player_symbol == player1_symbol
  end

  puts
  Player.new(player_name, player_symbol)
end

player1 = create_player(1)
player2 = create_player(2, player1.symbol)

game = Game.new(player1, player2)
game.play_game