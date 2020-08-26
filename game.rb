require_relative 'board'

class Game

  attr_accessor :rand_selected_word, :board

  def initialize
    @rand_selected_word = File.open('5desk.txt', 'r').readlines.sample.chomp
    @board = Board.new(self.rand_selected_word)
  end

  def main_game_loop
    puts "Hi! Welocme to hangman."
    self.board.print_board
  end
end


game = Game.new
game.main_game_loop
