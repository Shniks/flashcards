require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require 'pry'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", "Not Anchorage")
  end

  def test_if_it_exists
    assert_instance_of Card, @card
  end

  def test_if_it_has_a_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_if_it_has_an_answer
    assert_equal "Juneau", @card.answer
  end

  def test_if_it_can_take_hints
    assert_equal "Not Anchorage", @card.hint
  end

end
