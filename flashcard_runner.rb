require './lib/game_play.rb'

    game = GamePlay.new
    game.get_user_name
    game.get_user_deck_input
    game.assign_correct_file_based_on_user_deck_choice
    game.initialize_game
    game.play_game
    game.game_response
    game.game_result
    game.game_output_file
