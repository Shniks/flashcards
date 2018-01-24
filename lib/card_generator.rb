
require 'pry'
require './lib/card'

class CardGenerator

  attr_reader :total_cards,
              :all_cards,
              :filename

  def initialize(filename)
    @total_cards = total_cards
    @all_cards = []
    @filename = filename
  end

  def number_of_cards
    contents = File.read(filename)
    @data = contents.split(/[\n,]/)
    @total_cards = @data.length / 3
  end

  def cards
    number_of_cards.times do
      all_cards << Card.new(@data[0], @data[1], @data[2])
      @data.slice!(0..2)
    end
    all_cards
  end

end
