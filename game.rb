class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  public
  def play_game
    set_start_state
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
      play_game
    else
      puts "Thanks for playing"
    end
  end

  private
  def set_start_state
    @board = Board.new(@player1, @player2)
    @game_over = false
    @player_turn = 1
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