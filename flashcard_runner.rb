require './lib/game_play.rb'

class FlashCardRunner

  def self.start_game
    game = GamePlay.new
    game.game_response
  end

end

FlashCardRunner.start_game
