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
      row = ""
      row.each_with_index do |col,col_idx|

        puts col.symbol
        #background: :red, color: :blue
      end
    end

  end




end
