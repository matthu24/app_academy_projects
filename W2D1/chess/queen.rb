require_relative 'piece'

class Queen < Piece
  def symbol

  end

protected
  def move_dirs
    moves = [[1,1],[-1,-1],[1,-1],[-1,1],[0,1],[1,0],[0,-1],[-1,0]]

  end
end
