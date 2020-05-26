class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @coords = ['a3', 'b3', 'c3', 'a2', 'b2', 'c2', 'a1', 'b1', 'c1']
    @grid = {}
    @coords.each do |coord|
      @grid[coord] = Square.new
    end
  end

  def draw_grid
    puts
    puts "      |     |     "
    puts "c  #{@grid['c1']}  |  #{@grid['c2']}  |  #{@grid['c3']}  "
    puts "      |     |     "
    puts " -----------------"
    puts "      |     |     "
    puts "b  #{@grid['b1']}  |  #{@grid['b2']}  |  #{@grid['b3']}  "
    puts "      |     |     "
    puts " -----------------"
    puts "      |     |     "
    puts "a  #{@grid['a1']}  |  #{@grid['a2']}  |  #{@grid['a3']}  "
    puts "      |     |     "
    puts "   1     2     3  "
    puts
  end
end