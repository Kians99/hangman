require_relative 'board'
require_relative 'player'

class Game

  attr_reader :rand_selected_word, :board, :player

  def initialize
    @rand_selected_word = File.open('5desk.txt', 'r').readlines.sample.chomp
    @board = Board.new(rand_selected_word)
    @player = Player.new
  end

  def start_game
    puts "\nHi! Welcome to hangman. The computer just thought of a word that you will
have to guess. Here is the board: "
    board.print_board
    puts "Please insert your guess as a single character like \"a\". Enjoy!\n "
    main_game_loop
  end


  def main_game_loop
    if player.make_guess
      puts "Great! Beep Boop. Here is the new board:"
    else
      puts "Hmm. That's not a character! Try again."
    end
    
    #board.contains_character?(guess)

  end

end


game = Game.new
game.start_game
