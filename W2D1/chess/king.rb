require_relative 'piece'
require_relative 'step_pieces.rb'

class King < Piece
  include StepPieces
  def symbol
    '♚'.colorize(color)
  end

protected
  def move_dirs
    moves = [[1,1],[-1,-1],[1,-1],[-1,1],[0,1],[1,0],[0,-1],[-1,0]]

  end
end
