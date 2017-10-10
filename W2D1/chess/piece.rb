#require 'byebug'

class Piece
  attr_accessor :pos
  attr_reader :color, :board

  def initialize(pos = nil,board = nil,color = nil)
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

  def move_into_check?(end_pos)
    board_dup = @board.deep_dup
    start_pos = @pos
    #debugger
    board_dup.move_piece!(start_pos, end_pos)
    board_dup.in_check?(@color)
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end



end
