require_relative 'piece'

class Rook < Piece
  def symbol

  end

protected
  def move_dirs
    moves = [[0,1],[1,0],[0,-1],[-1,0]] 
  end
end
