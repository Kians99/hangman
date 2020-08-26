require_relative 'board'
require_relative 'player'

class Game

  attr_reader :rand_selected_word, :board, :player

  def initialize
    #File.open('5desk.txt', 'r').readlines.sample.chomp
    @rand_selected_word = "Praxiteles".downcase
    @board = Board.new(rand_selected_word)
    @player = Player.new
  end

  def start_game 
    puts "\nHi! Welcome to hangman. The computer just thought of a word that you will
have to guess. Here is the board: "
    board.print_board
    puts "\nPlease insert your guess as a single character like \"a\". Enjoy!\n "
    main_game_loop
  end

  def game_over?
    false
  end

  def match?(guess)
    board.contains_character?(guess) != []
  end

  def already_inputted(guess)
    player.already_guessed.include?(guess)
  end
  
  def main_game_loop
  
  until game_over?
    guess = player.make_guess.downcase
    if player.valid_guess(guess) && !self.already_inputted(guess)
      player.already_guessed.push(guess)
      if match?(guess)
        arr_of_matching_indices = board.contains_character?(guess)
        board.change_board(arr_of_matching_indices, guess)
        puts "Awesome—you got a match!"
      else
        puts "No match—Keep Trying!" 
      end
    elsif already_inputted(guess)
      puts "You guessed that letter already!"
    else
      puts "Hmm. That's not a character! Try again."
    end
    
  end

  end
end
 


game = Game.new
game.start_game
