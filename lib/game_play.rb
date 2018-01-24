require './lib/round'
require './lib/deck'
require './lib/card_generator'
require 'io/console'
require './lib/messages'
require 'pry'

class GamePlay

  include Messages

  attr_reader   :deck
  attr_accessor :deck_choice,
                :filename

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
    validate_choice(@deck_choice)
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

  def assign_correct_file_based_on_user_deck_choice
    if @deck_choice == "1"
      @filename = './friends.txt'
      @deck_name = 'Friends'
    else
      @filename = './sayings.txt'
      @deck_name = 'Famous Sayings'
    end
  end

  def initialize_game
    @cards = CardGenerator.new(@filename).cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @card_count = 0
  end

  def play_game
    clear
    @round.deck.cards.length.times do
      deck_welcome_message(@deck_name, @cards)
      deck_choice_message(@deck_choice)
      playing_card = @deck.cards[@card_count]
      card_number_and_round_message(@card_count, @round, playing_card)
      response = gets.chomp.to_s
      response = hint_message(response, playing_card)
      "#{@round.record_guess(response)}\n"
      puts @round.guesses.last.feedback
      correct_answer_if_incorrect_guess_message(@round, playing_card)
      puts " "
      @card_count += 1
      press_any_key_message
      STDIN.getch
      clear
    end
  end

  def game_response
    clear
    game_over_response(@round, @user_name)
    STDIN.getch
    clear
  end

end
