require './lib/guess'
require 'pry'

class Round

  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize (deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @card_count = 0
  end

  def current_card
    deck.cards[@card_count]
  end

  def record_guess(guess)
    guesses << guess = Guess.new(guess, current_card)
    @number_correct += 1 if guess.correct?
    @card_count += 1
  end

  def percent_correct
    ((@number_correct.to_f / guesses.count) * 100).round
  end

end
