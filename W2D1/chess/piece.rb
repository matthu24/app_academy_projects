

class Piece
  attr_accessor :pos
  attr_reader :color, :board

  def initialize(pos,board,color = nil)
    @pos = pos
    @color = color
    @board = board
  end

  def to_s

  end

  def empty?

  end

  def symbol

  end

  def valid_moves

  end

  private
  def move_into_check(to_pos)

  end

end
