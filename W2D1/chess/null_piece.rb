require 'singleton'

class NullPiece < Piece
  include Singleton

  # def initialize(pos,board,color)
  # end

  def symbol
    " "
  end

  def moves

  end
end
