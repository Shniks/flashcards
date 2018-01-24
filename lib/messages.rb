module Messages

  def user_name_message
    print "Welcome to Flashcards\n---------------------\n\n"
    print "Please enter your name: "
  end

  def user_deck_input_message
    puts "Please choose your deck\n-----------------------\n\n"
    puts "Enter '1' for 'Friends', 'Enter '2' for 'Famous Sayings'"
  end

  def validate_choice_message
    puts "Your input is invalid\n---------------------\n\n"
    puts "Please enter either '1' to play 'Friends' or '2' to play 'Famous Sayings'..."
  end

  def user_choice_message
    print "Your choice: "
  end

  def deck_welcome_message(deck_name, cards)
    puts "Welcome! You're playing the '#{deck_name}' deck with #{cards.length} cards"
  end

  def deck_choice_message(deck_choice)
    if deck_choice == "1"
      puts "--------------------------------------------------------\n\n"
    elsif deck_choice == "2"
      puts "---------------------------------------------------------------\n\n"
    end
  end

  def card_number_and_round_message(card_count, round, playing_card)
    puts "This is card number #{card_count + 1} out of #{round.deck.cards.length}.\n\nQuestion: #{playing_card.question}"
    print "Your answer: "
  end


end
