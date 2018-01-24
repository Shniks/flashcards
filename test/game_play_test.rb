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

  def test_assign_correct_file_based_on_user_deck_choice
    @game.deck_choice = "1"
    assert_equal "Friends", @game.assign_correct_file_based_on_user_deck_choice
    assert_equal './friends.txt', @game.filename
  end

  def test_if_outside_classes_instantiated
    @game.filename = './friends.txt'
    @game.initialize_game
    assert_instance_of Deck, @game.deck
  end

end
