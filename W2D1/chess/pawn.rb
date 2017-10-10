require_relative 'piece'

class Pawn < Piece
  def symbol
    '♙'.colorize(color)
  end

protected
  def move_dirs
    # for now just put 1,0
    # TODO:
    moves = [[1,0]]
  end
end
