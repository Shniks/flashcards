require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", "Not Anchorage")
    deck = Deck.new([card])

    assert_instance_of Deck, deck
    assert_equal [card], deck.cards
    assert_equal 1, deck.count
  end

  def test_cards_can_be_stored
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Not Anchorage")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "The red planet")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "Subract given number from 360°")
    deck = Deck.new([card_1, card_2, card_3])
    deck.cards

    assert_instance_of Deck, deck
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

end
