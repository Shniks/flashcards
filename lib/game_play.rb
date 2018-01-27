require './lib/round'
require './lib/deck'
require './lib/card_generator'
require 'io/console'
require './lib/messages'
require 'pry'
require 'Date'

class GamePlay

  attr_reader :deck_choice,
              :round

  include Messages

  def initialize
    @card_count = 0
  end

  def get_user_name
    clear
    user_name_message
    @user_name = gets.chomp
  end

  def get_user_deck_input
    clear
    user_deck_input_message
    user_choice_message
    @deck_choice = gets.chomp
    validate_choice(deck_choice)
  end

  def validate_choice(choice)
    until choice.to_i.between?(1,2) do
      clear
      validate_choice_message
      user_choice_message
      choice = gets.chomp
    end
    @deck_choice = choice
  end

  def assign_deck
    if deck_choice == "1"
      {'Friends' => './friends.txt'}
    else
      {'Famous Sayings' => './sayings.txt'}
    end
  end

  def initialize_game
    @cards = CardGenerator.new(assign_deck.values.join).cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def begin_game
    clear
    deck_welcome_message(assign_deck.keys.join, @cards)
    deck_choice_message(deck_choice)
    @playing_card = @deck.cards[@card_count]
    card_number_and_round_message(@card_count, @round, @playing_card)
  end

  def play_game
    @round.deck.cards.length.times do
      begin_game
      first_response = gets.chomp.to_s
      final_response = hint_message(first_response, @playing_card)
      @round.record_guess(final_response)
      puts @round.guesses.last.feedback
      correct_answer_if_incorrect_guess_message(@round, @playing_card)
      advance_next_card
    end
  end

  def advance_next_card
    puts " "
    @card_count += 1
    press_any_key_message
    STDIN.getch
    clear
  end

  def game_response
    clear
    game_over_response(@round, @user_name)
    STDIN.getch
    clear
  end

  def game_result
    final_result = "Question,Answer,Player Response,Response Correct?\n"
    @round.guesses.each_with_index do |guess, index|
      final_result += "#{guess.card.question}," + "#{guess.card.answer}," + "#{guess.response}," + "#{@round.user_response[index]}\n"
    end
    final_result
  end

  def game_output_file
    date_time = DateTime.now
    result = "results-" + date_time.strftime("%Y-%m-%d-%H:%M")
    IO.write(result, game_result)
  end

end
