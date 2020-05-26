class Game
  def initialize
    @player_number = 1
    @used_symbol = nil
    @player1 = create_player
    @player2 = create_player
    @board = Board.new(@player1, @player2)
    @game_over = false
    @player_turn = 1
    play_game
  end

  private
  def create_player
    puts "Enter the name of player #{@player_number.to_s}:"
    player_name = gets.chomp
    player_symbol = ''

    until player_symbol.length == 1 && player_symbol != @used_symbol
      puts "Enter the symbol for #{player_name}, must be exactly one character long:"
      player_symbol = gets.chomp
      puts "Cannot use the same symbol as #{@player1.name}" if player_symbol == @used_symbol
    end

    @player_number += 1
    @used_symbol = player_symbol
    puts
    Player.new(player_name, player_symbol)
  end

  def play_game
    @board.draw_grid

    until @game_over
      @player_turn == 1 ? mark_square(@player1) : mark_square(@player2)

      winner = @board.winner?
      if winner
        puts "#{winner.name} wins!"
        @game_over = true
      elsif @board.draw?
        puts "The game has ended in a draw!"
        @game_over = true
      end

      @player_turn == 1 ? @player_turn = 2 : @player_turn = 1
    end
    
    print "Play another game (y/n)? "
    again = nil
    until again == 'y' || again == 'n' do
      again = gets.chomp.downcase
    end
    if again == 'y'
      initialize
    else
      puts "Thanks for playing"
    end
  end

  def mark_square(player)
    print "Please enter the coordinates of the square you wish to mark, #{player.name}: "
    coords = gets.chomp
    if !@board.coords.include? coords.downcase
      puts "Invalid choice"
      mark_square(player)
      return
    end    
    
    if @board.grid[coords].mark_square(player)
      @board.draw_grid
    else
      puts "That square is already taken!"
      mark_square(player)
      return
    end
  end
end