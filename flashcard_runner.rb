require './lib/game_play.rb'

class FlashCardRunner

  def self.start_game
    game = GamePlay.new
    game.get_user_name
    game.get_user_deck_input
    game.assign_correct_file_based_on_user_deck_choice
    game.initialize_game
    game.play_game
    game.game_response
  end

end

FlashCardRunner.start_game
