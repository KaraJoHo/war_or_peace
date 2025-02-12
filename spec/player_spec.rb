require 'rspec' 
require './lib/card'
require './lib/deck' 
require './lib/player'

RSpec.describe Player do 
  it 'exists and has a deck of cards' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3]) 
    player = Player.new('Clarisa', deck) 

    expect(player).to be_a(Player)
    expect(player.name).to eq('Clarisa')
    expect(player.deck).to eq(deck)
  end

  describe '#has_lost?' do 
    it 'returns true is the player has no more cards in their deck' do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)  
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3]) 
      player = Player.new('Clarisa', deck) 

      expect(player.has_lost?).to eq(false)

      player.deck.remove_card

      expect(player.has_lost?).to eq(false)
      
      player.deck.remove_card 

      expect(player.has_lost?).to eq(false)

      player.deck.remove_card

      expect(player.has_lost?).to eq(true)
    end
  end
end