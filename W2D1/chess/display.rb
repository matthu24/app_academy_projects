require_relative 'board.rb'
require_relative 'cursor.rb'
# require_relative 'piece.rb'
require 'colorize'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    #@board_render_arr
  end



  def render
    cursor_pos = @cursor.cursor_pos

    @board.grid.each_with_index do |row,row_idx|
      row.each_with_index do |col,col_idx|
        bgc = ((row_idx + col_idx)%2 == 0) ? :white : :grey
        if [row_idx, col_idx] == cursor_pos
          bgc = :yellow
        end
        print "#{col.symbol + " "}".colorize(background: bgc)
        #background: :red, color: :blue
      end
      puts " "
    end
    return
  end

  def move_cursor

    render
    input = nil
    while input == nil
      input = @cursor.get_input
      system("clear")
      render
    end
    #when we exit loop, input will be the position of the cursor
    return input
  end






end
