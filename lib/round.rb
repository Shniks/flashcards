require './lib/guess'
require 'pry'

class Round

  attr_reader :deck,
              :guesses,
              :number_correct,
              :user_response

  def initialize (deck)
    @deck = deck
    @guesses = []
    @user_response = []
    @number_correct = 0
    @card_count = 0
  end

  def guesses
    @guesses
  end

  def current_card
    deck.cards[@card_count]
  end

  def record_guess(guess)
    guesses << guess = Guess.new(guess, current_card)
    user_response << guess.correct?
    @number_correct += 1 if guess.correct?
    @card_count += 1
  end

  def percent_correct
    ((@number_correct.to_f / guesses.count) * 100).round
  end

end
