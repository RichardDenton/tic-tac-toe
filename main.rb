require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'square'

def create_player(player_number)
  puts "Enter the name of player #{player_number.to_s}:"
  player_name = gets.chomp
  player_symbol = ''

  until player_symbol.length == 1 && !Player.taken_symbols.include?(player_symbol)
    puts "Enter the symbol for #{player_name}, must be exactly one character long:"
    player_symbol = gets.chomp
    puts "Cannot use the same symbol as another player" if Player.taken_symbols.include?(player_symbol)
  end

  puts
  Player.new(player_name, player_symbol)
end

game = Game.new(create_player(1), create_player(2))
game.play_game