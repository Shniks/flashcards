class Deck

  attr_reader :cards,
              :count

  def initialize(data)
    @cards = data
    @count = @cards.count
  end

end
