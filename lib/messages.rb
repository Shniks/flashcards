module Messages

  def clear
    system "clear"
  end

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
    puts "(Enter 'Hint' at anytime to get a hint)\n\n"
    print "Your answer: "
  end

  def hint_message(response, playing_card)
    if response.downcase == "hint"
      puts " "
      print "Hint: "
      hint_mess = true
      puts playing_card.hint
      until response.downcase != "hint" do
        print "Guess again: "
        response = gets.chomp.to_s
        puts " "
        puts "Jeez! I have already given the hint. Quit being greedy...\n" if response.downcase == "hint"
      end
    end
    response
  end

  def correct_answer_if_incorrect_guess_message(round, playing_card)
    puts "The correct answer is '#{playing_card.answer}'." if round.guesses.last.feedback == "Incorrect!"
  end

  def press_any_key_message
    print "Press any key to proceed..."
  end

  def game_over_response(round, user_name)
    puts "****** Game over! ******\n\n"
    puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a score of #{round.percent_correct}%.\n"
    if round.percent_correct > 75
      puts "#{user_name}, you are a genius! Your mama would be so proud. Nice job!\n\n"
    else
      puts "#{user_name}, you ain't a genius fo sho. Shame on you and the horse you rode in on!\n\n"
    end
    print "Press any key to exit the game..."
  end

end
