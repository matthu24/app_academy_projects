require_relative 'board.rb'
require_relative 'player.rb'



class Game
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1


  end

  def play

  end

  def notify_players

  end

  def swap_turn
    @current_player = (@current_player == @player1 ? @player2 : @player1)

  end



end
