require_relative 'piece'
require_relative 'step_pieces.rb'

class Pawn < Piece
  include StepPieces
  def symbol
    '♙'.colorize(color)
  end

  protected
  def move_dirs
    if color == :black
      # first move
      if pos[0] == 1
        directions = [[1,0],[2,0]]
      else
        directions = [[1,0]]
      end
      # enemy on lower left diag
      lower_left = [pos[0] + 1, pos[1] - 1]
      if @board.in_bounds?(pos[0] + 1, pos[1] - 1)
        if !@board[lower_left].is_a?(NullPiece) && @board[lower_left].color == :red
          directions << [1,-1]
        end
      end

      # enemy on lower right diag
      lower_right = [pos[0] + 1, pos[1] + 1]
      if @board.in_bounds?(pos[0] + 1, pos[1] + 1)
        if !@board[lower_right].is_a?(NullPiece) && @board[lower_right].color == :red
          directions << [1,1]
        end
      end
      #for white
    else
      if pos[0] == 6
        directions = [[-1,0],[-2,0]]
      else
        directions = [[-1,0]]
      end
      # enemy on upper left diag
      upper_left = [pos[0] - 1, pos[1] - 1]
      if @board.in_bounds?(pos[0] - 1, pos[1] - 1)
        if !@board[upper_left].is_a?(NullPiece) && @board[upper_left].color == :black
          directions << [-1,-1]
        end
      end
      # enemy on upper right diag
      upper_right = [pos[0] - 1, pos[1] + 1]
      if @board.in_bounds?(pos[0] - 1, pos[1] + 1)
        if !@board[upper_right].is_a?(NullPiece) && @board[upper_right].color == :black
          directions << [-1,1]
        end
      end
    end
    directions
  end


end
