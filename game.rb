require_relative 'board'
require_relative 'player'
require 'yaml'

class Game

  attr_accessor :rand_selected_word, :board, :player, :number_of_saves

  def initialize
    @rand_selected_word = File.open('5desk.txt', 'r').readlines.sample.chomp.downcase
    @board = Board.new(rand_selected_word)
    @player = Player.new(rand_selected_word.length)
  end

  def start_game 
    puts "\nHi! Welcome to hangman. The computer just thought of a word that you will
have to guess. Here is the board: "
    board.print_board
    puts "\nPlease insert your guess as a single character like \"a\".
You start off with #{player.guesses_left} guesses (twice the length of the word). \n "
    puts "If you would like to access one of your previously saved games, type \"Continue\"."
    puts "You can save your current game at any time just by typing \"Save\". Note that this
will overwrite your previous save. Have fun!"
    main_game_loop
  end

  def game_over? 
    !board.board_print_out.include?('_ ')
  end

  def match?(guess)
    board.contains_character?(guess) != []
  end

  def already_inputted(guess)
    player.all_guesses.include?(guess)
  end

  def the_input_matches(guess)
    puts "Awesome—you got a match!" 
    arr_of_matching_indices = board.contains_character?(guess)
    board.change_board(arr_of_matching_indices, guess)
  end

  def final_output
    game_over? ? (puts "YOU WIN! You succesfully guessed the word!") : (puts "You lose. You ran out of guesses. The correct word was: \"#{rand_selected_word.capitalize}\".")
  end

  def add_to_guesses(guess)
    player.already_guessed.push(guess)
  end

  def delete_saved_file
    path_to_file = "./saved.txt"
    File.delete(path_to_file) if File.exist?(path_to_file)
  end

  def serialize(game_class)
    File.open("saved.txt", "w") { |file| file.puts(YAML.dump(game_class)) }
    return YAML.dump(game_class)
  end

  def check_serialize(input)
    if input.casecmp("Save").zero?
      puts "worked"
      serialize(self)
      true
    end
  end

  def load_saved_game
    game = YAML.load(File.open("saved.txt", "r") { |file| file.read })
    self.rand_selected_word = game.rand_selected_word
    self.board = game.board
    self.player = game.player
    
    
  end
  
  def main_game_loop
    until game_over? || player.guesses_left == 0
      guess = player.make_guess.downcase
      puts "————————————————————————————————————————————————————————"
      abort "You decided to save the game." if self.check_serialize(guess)
      load_saved_game if guess.casecmp("Continue").zero?
      if player.valid_guess(guess) && !self.already_inputted(guess)
        player.guesses_left -= 1
        if match?(guess) && !player.correctly_guessed.include?(guess)
          puts guess
          player.correctly_guessed.push(guess)
          player.all_guesses = player.already_guessed.concat(player.correctly_guessed)
          the_input_matches(guess)
        else
          puts "No match—Keep Trying!" 
          add_to_guesses(guess)
          board.print_board
        end
        print "Incorrect Guesses: #{player.already_guessed.uniq.join(',')}  " + "Guesses Remaining: #{player.guesses_left}" + "\n"
      elsif already_inputted(guess)
        puts "You guessed that letter already—You still lose a guess!"
        player.guesses_left -= 1
        board.print_board
        print "Incorrect Guesses: #{player.already_guessed.uniq.join(',')}  " + "Guesses Remaining: #{player.guesses_left}" + "\n"
      elsif !guess.casecmp("continue").zero? && !guess.casecmp("save").zero?
        puts "Hmm. That's not a character! Try again."
      else
        puts "You loaded your last saved game. Guess away!"
        board.print_board
        print "Incorrect Guesses: #{player.already_guessed.uniq.join(',')}  " + "Guesses Remaining: #{player.guesses_left}" + "\n"
      end
      puts "————————————————————————————————————————————————————————"
    end
    final_output
  end

end
 
game = Game.new
game.start_game
