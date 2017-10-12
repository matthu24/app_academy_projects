require 'poker'
require 'rspec'

RSpec.describe Poker do
  subject(:game) {Poker.new(5)}
  describe "#initialize" do
    it "creates a deck" do
      expect(game.deck).to be_an_instance_of(Deck)
    end

    it "initializes the players" do
      expect(game.players.length).to eq(5)
    end
  end

  describe "#deal" do
    it "distributes five cards to each player"

  end

end
