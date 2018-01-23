class Guess

  attr_reader :response,
              :card

  def initialize(response, card)
    @card = card
    @response = response
  end

  def correct?
    return true if card.answer.downcase == response.downcase
    false
  end

  def feedback
    return "Correct!" if correct?
    "Incorrect!"
  end

end
