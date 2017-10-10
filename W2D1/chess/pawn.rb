require_relative 'piece'
require_relative 'step_pieces.rb'

class Pawn < Piece
  include StepPieces
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
