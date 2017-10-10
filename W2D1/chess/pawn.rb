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
      if !@board[[pos[0] + 1,pos[1] - 1]].is_a?(NullPiece) && @board[[pos[0] + 1,pos[1] - 1]].color == :white
        directions << [1,-1]
      end
      # enemy on lower right diag
      if !@board[[pos[0] + 1,pos[1] + 1]].is_a?(NullPiece) && @board[[pos[0] + 1,pos[1] + 1]].color == :white
        directions << [1,1]
      end
    #for white
    else
      if pos[0] == 6
        directions = [[-1,0],[-2,0]]
      else
        directions = [[-1,0]]
      end
      # enemy on upper left diag
      if !@board[[pos[0] - 1,pos[1] - 1]].is_a?(NullPiece) && @board[[pos[0] - 1,pos[1] - 1]].color == :black
        directions << [-1,-1]
      end
      # enemy on upper right diag
      if !@board[[pos[0] - 1,pos[1] + 1]].is_a?(NullPiece) && @board[[pos[0] - 1,pos[1] + 1]].color == :black
        directions << [-1,1]
      end
    end
    directions
  end


end
