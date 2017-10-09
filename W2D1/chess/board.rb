require_relative 'piece.rb'


class Board
  def initialize
    @grid = Array.new(8){Array.new(8)}
    fill_board
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,piece)
    x,y = pos
    @grid[x][y] = piece
  end



  def fill_board

  end

  def dup

  end

  def move_piece(color,from_pos,to_pos)

  end

  def move_piece!(from_pos,to_pos)

  end

  def checkmate?

  end

  def find_king(color)

  end
end
