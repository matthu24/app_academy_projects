#rook bishop queen
module SlidePieces
  def moves
    moves = []
    move_dirs.each do |move|
      moves.concat(grow_unblocked_moves_in_dir(move[0],move[1]))
    end
    moves
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    moves = []
    from_x,from_y = pos
    (1..7).each do |square|
      to_x,to_y = from_x + dx*square, from_y + dy*square
      if [to_x,to_y].all?{|i| i.between?(0,7)}

        if board[[to_x,to_y]].is_a?(NullPiece)
          moves << [to_x,to_y]
          #piece is blocked by different color piece
        elsif board[[to_x,to_y]].color != @color
          moves << [to_x,to_y]
          break
        else
          break
        end
      else
        break
      end
    end
    moves
  end


end
