require './lib/game_play.rb'

class FlashCardRunner

  def self.start_game
    GamePlay.new.game_response
  end

end

FlashCardRunner.start_game
