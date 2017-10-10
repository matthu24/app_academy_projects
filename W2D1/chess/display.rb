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
    @board.grid.each_with_index do |row,row_idx|
      row.each_with_index do |col,col_idx|
        bgc = ((row_idx + col_idx)%2 == 0) ? :white : :grey
        print "#{col.symbol + " "}".colorize(background: bgc)
        #background: :red, color: :blue
      end
      puts " "
    end

  end




end
