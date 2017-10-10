require_relative 'piece.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'
require_relative 'null_piece.rb'


class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8){Array.new(8)}
    fill_board

  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,piece)
    x,y = pos
    @grid[x][y] = piece
  end

  def in_bounds?(x,y)
    return [x,y].all? {|e| e.between?(0,7)}
  end

  def fill_board
    #row = 0 and 7
    pieces = [:Rook,:Knight,:Bishop,:Queen,:King,:Bishop,:Knight,:Rook]

    pieces.each_with_index do |piece,col|
      self[[0,col]] = Object.const_get(piece).new([0,col],self,:black)
      self[[7,col]]= Object.const_get(piece).new([7,col],self,:white)
    end

    # row 2 to 5
    (2..5).each do |row|
      (0..7).each do |col|
        self[[row, col]] = NullPiece.instance
      end
    end

    #row 1 and 6
    (0..7).each do |col|
      self[[1,col]] = Pawn.new([1,col],self,:black)
      self[[6,col]] = Pawn.new([6,col],self,:white)
    end

  end

  def dup

  end

  def move_piece(color,from_pos,to_pos)
    if self[from_pos].is_a?(NullPiece)
      raise StandardError.new "There is no piece here"
    elsif !self[from_pos].valid_moves.include?(to_pos)
      raise StandardError.new "Not a valid move"


    end

    move_piece!(from_pos,to_pos)

  end

  def move_piece!(from_pos,to_pos)
    self[from_pos],self[to_pos] = self[to_pos],self[from_pos]
  end

  def checkmate?

  end

  def find_king(color)

  end
end
