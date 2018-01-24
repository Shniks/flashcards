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
    system "clear"
    user_name_message
    @user_name = gets.chomp
  end

  def get_user_deck_input
    system "clear"
    user_deck_input_message
    user_choice_message
    @deck_choice = gets.chomp
    validate_choice(@deck_choice)
  end

  def validate_choice(choice)
    until choice.to_i.between?(1,2) do
      system "clear"
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
    system "clear"
    @round.deck.cards.length.times do
      deck_welcome_message(@deck_name, @cards)
      deck_choice_message(@deck_choice)
      playing_card = @deck.cards[@card_count]
      card_number_and_round_message(@card_count, @round, playing_card)
      response = gets.chomp.to_s
      "#{@round.record_guess(response)}\n"
      puts @round.guesses.last.feedback
      puts "The correct answer is '#{playing_card.answer}'." if @round.guesses.last.feedback == "Incorrect!"
      puts " "
      @card_count += 1
      print "Press any key to proceed..."
      STDIN.getch
      system "clear"
    end
  end

  def game_response
    system "clear"
    puts "****** Game over! ******\n\n"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.length} for a score of #{@round.percent_correct}%.\n"
    if @round.percent_correct > 75
      puts "#{@user_name}, you are a genius! Your mama would be so proud. Nice job!\n\n"
    else
      puts "#{@user_name}, you ain't a genius fo sho. Shame on you and the horse you rode in on!\n\n"
    end
    print "Press any key to exit the game..."
    STDIN.getch
    system "clear"
  end

end
