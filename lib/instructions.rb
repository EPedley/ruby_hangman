require_relative 'display.rb'

class TextInstructions
  
  def to_s

    <<~HEREDOC
    
#{"welcome to hangman".upcase.bold}

Hangman is a word-guessing game for two players - in this game you will be playing against the computer!

#{"Instructions:".underline}

  - The computer will randomly choose a word that is 5 to 12 characters long.
  - Each turn you can guess one letter of the word - if it's included the computer will fill in the blanks for you.
  - Guess the word in 10 turns or less or you #{"lose".bold.red}!

#{"IT'S GAME TIME".bold.underline}
  
    HEREDOC
  end

end