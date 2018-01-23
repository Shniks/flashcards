require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require 'pry'

class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Guess, guess
  end

  def test_user_can_submit_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.card
    guess.response
    guess.correct?

    assert_instance_of Card, guess.card
    assert_equal "Juneau", guess.response
    assert_equal true, guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_user_can_submit_another_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    guess.card
    guess.response
    guess.correct?

    assert_instance_of Card, guess.card
    assert_equal "Saturn", guess.response
    assert_equal false, guess.correct?
    assert_equal "Incorrect!", guess.feedback
  end

end
