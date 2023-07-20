module Logic

    def create_blanks(correct_word)
        arr = []
        correct_word.length.times do |x|
            if x == correct_word[-1]
            arr.append("-")
            else
            arr.append("_ ")
            end
        end
        arr
    end
  
    def update_user_word (word_so_far, guess, correct_word)
      correct_word = correct_word.split('')
      correct_word.each_with_index do |x, i|
        if x == guess
          word_so_far[i] = guess + " "
        end
      end
      word_so_far
    end
  
    def get_guess(guesses)
        guess = ""
        loop do
            guess = ask_for_guess
            if guesses.include?(guess)
                already_guessed(guess)
            elsif guess.length == 1 and guess.match(/[[:alpha:]]/)
                break
            else       
                invalid_guess 
            end
        end
        guess
    end
  
    def check_guess(correct_word, user_guess)
      if correct_word.include?(user_guess)
        correct_guess_message(user_guess)
        return true
      else
        incorrect_guess_message(user_guess)
        return false
      end
    end
    
  end