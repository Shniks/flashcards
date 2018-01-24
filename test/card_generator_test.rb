require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @cardgenerator = CardGenerator.new('./friends.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cardgenerator
  end

  def test_it_loads_external_file
    cardgenerator = CardGenerator.new('./friends.txt')
    assert_equal './friends.txt', cardgenerator.filename
  end

  def test_it_creates_a_cards_array
    cardgenerator = CardGenerator.new('./friends.txt')
    assert_equal 11, cardgenerator.number_of_cards
  end

  def test_it_creates_array_with_instances_of_card
    cardgenerator = CardGenerator.new('./friends.txt')
    assert_instance_of Card, cardgenerator.cards.first
  end

  def test_card_array_contains_all_the_expected_cards
    cardgenerator = CardGenerator.new('./friends.txt')
    assert_equal 11, cardgenerator.cards.count
  end

end
