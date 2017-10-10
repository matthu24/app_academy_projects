require_relative 'piece'
require_relative 'slide_pieces.rb'

class Bishop < Piece
  include SlidePieces
  def symbol
      '♗'.colorize(color)
  end

protected
  def move_dirs
    moves = [[1,1],[-1,-1],[1,-1],[-1,1]]
  end
end
