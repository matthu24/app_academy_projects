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
  def initialize(fill = true)
    @grid = Array.new(8){Array.new(8)}
    if fill
      fill_board
    end
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
      self[[7,col]]= Object.const_get(piece).new([7,col],self,:red)
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
      self[[6,col]] = Pawn.new([6,col],self,:red)
    end

  end

  def deep_dup
    board_dup = Board.new(false)
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        piece_pos = piece.pos
        if piece.is_a?(NullPiece)
          board_dup[[row_idx,col_idx]] = NullPiece.instance
        else
          piece_color = piece.color
          board_dup[piece_pos] = piece.class.new(piece_pos, board_dup, piece_color)
        end
      end
    end

    board_dup
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

  def checkmate?(color)
    in_check?(color) && pieces_valid_moves(color).empty?
  end

  #return an array of all pieces of that color
  def pieces(color)
    @grid.flatten.select{|piece| piece.color == color}
  end

  def pieces_valid_moves(color)
    all_moves = []
    pieces = pieces(color)
    pieces.each do |piece|
      all_moves.concat(piece.valid_moves)
    end
    all_moves
  end

  def in_check?(color)
    king = find_king(color)
    king_position = king.pos
    enemy_color = (color == :white ? :black : :white)
    enemy_pieces = pieces(enemy_color)
    enemy_pieces.each do |piece|
      return true if piece.moves.include?(king_position)
    end
    false
  end

  def find_king(color)
    @grid.each_with_index do |row,row_idx|
      row.each_with_index do |square,col_idx|
        piece = self[[row_idx,col_idx]]
        return piece if piece.is_a?(King) && piece.color == color
      end
    end
  end
end
