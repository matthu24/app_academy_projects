require_relative 'piece'

class Knight < Piece
  def symbol
    '♘'.colorize(color)
  end

protected
  def move_dirs
    moves = [[2,1],[-2,-1],[1,-2],[-1,2],[-1,-2],[1,2],[-2,1],[2,-1]]
  end
end
