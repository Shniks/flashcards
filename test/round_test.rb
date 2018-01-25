require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  attr_reader :card_1,
              :card_2,
              :deck,
              :round

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Not Anchorage")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000", "Less than 100 million")
    @deck = Deck.new([card_1, card_2])
    @round = Round.new(deck)
  end

  def test_it_exists
    assert_instance_of Round, round
  end

  def test_has_initial_empty_guesses_array
    assert_equal [], round.guesses
    assert_equal 2, round.deck.cards.count
  end

  def test_gets_current_card
    assert_instance_of Card, round.current_card
    assert_equal card_1, round.current_card
  end

  def test_it_records_guess
    result = round.record_guess("Juneau")

    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_records_another_guess_that_is_correct
    result = round.record_guess("Juneau")
    result = round.record_guess("93,000,000")

    assert_equal 2, round.guesses.count
    assert_equal "Correct!", round.guesses.last.feedback
    assert_equal 2, round.number_correct
    assert_equal 100, round.percent_correct
  end

  def test_it_records_another_guess_that_is_incorrect
    result = round.record_guess("Juneau")
    result = round.record_guess("2")

    assert_equal 2, round.guesses.count
    assert_equal "Incorrect!", round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

  def test_it_records_both_guesses_that_are_incorrect
    result = round.record_guess("Anchorage")
    result = round.record_guess("2000")

    assert_equal 2, round.guesses.count
    assert_equal "Incorrect!", round.guesses.last.feedback
    assert_equal 0, round.number_correct
    assert_equal 0, round.percent_correct
  end

  def test_it_records_if_user_response_was_true_or_false
    result = round.record_guess("Juneau")

    assert_equal [true], round.user_response
    refute_equal [false], round.user_response
  end

  def test_it_records_whether_another_user_response_was_true_or_false
    result = round.record_guess("Juneau")
    result = round.record_guess("2")

    assert_equal [true, false], round.user_response
  end

end
