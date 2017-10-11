require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'display'

require 'byebug'

class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = Player.new(@display, :black)
    @player2 = Player.new(@display, :red)
    @current_player = @player1
  end

  def play
    until @board.checkmate?(:black) || @board.checkmate?(:red)
      #begin
      from_pos, to_pos = @current_player.play_turn
      # debugger
      puts "#{from_pos}#{to_pos}"
        @board.move_piece(from_pos, to_pos)
      #rescue StandardError => e
      #  puts e.message
      #  retry
      #end
      swap_turn
    end
  end

  # def notify_players
  #
  # end

  def swap_turn
    @current_player = (@current_player == @player1 ? @player2 : @player1)

  end

end


if __FILE__ == $PROGRAM_NAME
  new_game = Game.new
  new_game.play
end
