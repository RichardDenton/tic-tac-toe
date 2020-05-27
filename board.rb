class Board
  attr_reader :grid, :coords
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @coords = ['c1', 'c2', 'c3', 'b1', 'b2', 'b3', 'a1', 'a2', 'a3']
    @winning_combos = [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3'], 
                       ['a1', 'b1', 'c1'], ['a2', 'b2', 'c2'], ['a3', 'b3', 'c3'],
                       ['a1', 'b2', 'c3'], ['a3', 'b2', 'c1']]
    @grid = {}
    @coords.each do |coord|
      @grid[coord] = Square.new
    end
  end

  public
  def draw_grid
    puts
    puts "       |     |     "
    puts "3   #{@grid['a3']}  |  #{@grid['b3']}  |  #{@grid['c3']}  "
    puts "       |     |     "
    puts "  -----------------"
    puts "       |     |     "
    puts "2   #{@grid['a2']}  |  #{@grid['b2']}  |  #{@grid['c2']}  "
    puts "       |     |     "
    puts "  -----------------"
    puts "       |     |     "
    puts "1   #{@grid['a1']}  |  #{@grid['b1']}  |  #{@grid['c1']}  "
    puts "       |     |     "
    puts "    a     b     c  "
    puts
  end

  def winner?
    @winning_combos.each do |combo|
      if @grid[combo[0]].is_owned?
        if @grid[combo[0]].owner == @grid[combo[1]].owner && @grid[combo[1]].owner == grid[combo[2]].owner
          return @grid[combo[0]].owner
        end
      end
    end
    false
  end

  def draw?
    owned_count = 0
    @grid.each_value do |square|
      owned_count += 1 if square.is_owned?
    end
    owned_count == @grid.length ? true : false
  end
end