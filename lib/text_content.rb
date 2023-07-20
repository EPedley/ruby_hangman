module TextContent

    def round(round)
      puts "\n#{"ROUND #{round}".bold.underline}"
    end
  
    def turns_remaining(turns_remaining)
      if turns_remaining == 1
        "\nYou have #{"1".red} turn remaining!"
      elsif turns_remaining > 1
        "\nYou have #{"#{turns_remaining}".red} turns remaining!"
      end
    end
  
    def ask_for_guess
      puts "\nEnter your guess below:"
      gets.chomp
    end
  
    def invalid_guess
      puts "\n#{"Your guess is invalid. Please try again.".red}"
    end

    def already_guessed(guess)
        puts "\n#{"You've already guesses #{guess}! Please try again.".red}"
    end
  
    def correct_guess_message(user_guess)
      puts "\n#{"You guessed correctly! The secret word does include #{user_guess.bold}.\n".green}"
    end
  
    def incorrect_guess_message(user_guess)
      puts "\n#{"You guessed incorrectly! The secret word does not include #{user_guess.bold}.\n".red}\n"
    end
  
    def game_lost(correct_guess)
      puts "#{"\nYou lost the game! The secret word was #{correct_guess.bold.blue}\n\n".red.bold}"
    end
  
    def game_won(correct_guess)
      puts "#{"\nYou won the game! The secret word was #{correct_guess.bold.blue}\n\n".green.bold}"
    end
  
    def incorrect_guesses(incorrect_guesses, correct_word)
      puts "#{"So far you have guessed:".blue}"
      str = ""
      incorrect_guesses.split.each do |x|
        if correct_word.include?(x)
          str += "#{x.bold.green} "
        else
          str += "#{x.bold.red} "
        end
      end
      puts str
    end

    def save_message
        puts "\nWould you like to save your progress? Press 1 for YES and 2 for NO."
        gets.chomp
    end

    def game_saved(filename)
       puts "#{"\nYour game has been saved as '#{filename}'".blue}"
    end

    def check_for_load
        puts "\nWould you like to load your previous progress? Press 1 for YES and 2 for NO."
        response = gets.chomp
        if response == "1"
            return "load"
        else
            return "new"
        end
    end 

    def get_filename
        puts "\n" + "Enter your filename below:"
        gets.chomp
    end

  end