require_relative 'deck'
require_relative 'player'

class Poker
  attr_accessor :deck, :players
  def initialize(num_players)
    @deck = Deck.new
    @players = Poker.init_players(num_players)


  end

  def self.init_players(num_players)
    players = []
    num_players.times do
      players << Player.new(@deck)
    end
    players

  end



end
