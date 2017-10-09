require_relative 'piece'

class Bishop < Piece
  def symbol

  end

protected
  def move_dirs
    moves = [[2,1],[-2,-1],[1,-2],[-1,2],[-1,-2],[1,2],[-2,1],[2,-1]]
  end
end
