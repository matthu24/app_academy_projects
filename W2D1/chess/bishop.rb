require_relative 'piece'

class Bishop < Piece
  def symbol
      '♗'.colorize(color)
  end

protected
  def move_dirs
    moves = [[1,1],[-1,-1],[1,-1],[-1,1]]
  end
end
