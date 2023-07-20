require "yaml"

require_relative "instructions"
require_relative "text_content"
require_relative "logic.rb"
require_relative "hangman.rb"

class Game

  include TextContent
  include Logic
  include Hangman

  def initialize   
    @turns_remaining = 10
    @user_word = []
    @guesses = ""
    @round = 1
    @dictionary = File.read('google-10000-english.txt')
    @word = ""
  end

  def play
    puts TextInstructions.new
    game_type = check_for_load
    if game_type == "load"
      load_game
    else
      new_game
    end
    puts @user_word.join("")
    play_round while @turns_remaining > 0
  end

  def play_round  
    round(@round)
    save_game
    user_guess = get_guess(@guesses)

    if check_guess(@word, user_guess)
      correct_guess(user_guess)
    else
      incorrect_guess(user_guess)
    end   
    @guesses += user_guess + " "
    show_results
    @round += 1
  end

  def correct_guess(user_guess)
    @user_word = update_user_word(@user_word, user_guess, @word)
    if @word == @user_word.join("").gsub(/\s+/, "")
      game_won(@word)
      exit
    end
  end  

  def incorrect_guess(user_guess)
    @turns_remaining -= 1
    if @turns_remaining == 0
      puts hangman(@turns_remaining)
      game_lost(@word)
      exit
    end
  end

  def show_results
    puts @user_word.join("")
    puts hangman(@turns_remaining)
    incorrect_guesses(@guesses, @word)
    puts turns_remaining(@turns_remaining)
  end

  def save_game
    save = save_message
    if save == "1"
        Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
        puts "Enter a file name:"
        name = gets.chomp
        filename = "saved_games/#{name}.yml"

        File.open(filename, 'w') do |file|
          saved_game = {
            user_word: @user_word,
            word: @word,
            turns_remaining: @turns_remaining,
            round: @round,
            guesses: @guesses
          }
          file.write(saved_game.to_yaml)
        puts game_saved(filename)
        end
    end
  end

  def load_game
    name = get_filename
    existing_file = YAML.load_file("saved_games/#{name}.yml")
    # puts existing_file.inspect

    @user_word = existing_file[:user_word]
    @turns_remaining = existing_file[:turns_remaining]
    @word = existing_file[:word]
    @round = existing_file[:round] - 1
    @guesses = existing_file[:guesses]

    round(@round)
    @round += 1
    show_results
  end

  def new_game
    @word = @dictionary.split("\n")[rand(9998)]
    @user_word = create_blanks(@word)
  end

end