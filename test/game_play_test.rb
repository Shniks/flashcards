require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_play'
require './lib/round'
require './lib/deck'
require './lib/card_generator'
require 'io/console'
require 'pry'

class GamePlayTest < Minitest::Test

  def setup
    @game = GamePlay.new
  end

  def test_if_it_exists
    assert_instance_of GamePlay, @game
  end

  def test_if_initial_card_count_is_zero
    assert_equal 0, @game.instance_variable_get(:@card_count)
  end

  def test_it_assign_a_deck
    @deck_choice = "2"
    expected = {'Famous Sayings' => './sayings.txt'}
    assert_equal expected, @game.assign_deck
  end

  def test_if_round_can_be_initialized
    assert_instance_of Round, @game.initialize_game
  end

end
