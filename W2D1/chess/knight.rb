require_relative 'piece'
require_relative 'step_pieces.rb'

class Knight < Piece
  include StepPieces
  def symbol
    '♘'.colorize(color)
  end

protected
  def move_dirs
    moves = [[2,1],[-2,-1],[1,-2],[-1,2],[-1,-2],[1,2],[-2,1],[2,-1]]
  end
end
