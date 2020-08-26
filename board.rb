require_relative 'computer'
require_relative 'letter'

class Board

  attr_accessor :letters

  def initialize(hidden_word)
    @letters = letter_array(hidden_word) 
  end

  def print_board
    puts "\n"
    puts '_ ' * letters.length
    puts "\n"
  end

  private

  def letter_array(hidden_word)
    hidden_word.chars.map do |letter|
      Letter.new(letter)
    end
  end
end

board = Board.new("hello")