require_relative 'computer'
require_relative 'letter'

class Board

  attr_accessor :letters, :board_print_out

  def initialize(hidden_word)
    @hidden_word = hidden_word
    @letters = hidden_word.chars
    @board_print_out = Array.new(hidden_word.length, '_ ')
  end

  def print_board
    puts "\n"
    print board_print_out
    puts "\n"
  end

end

def contains_character?(char_inp)
  index = hidden_word.indexOf(char_inp)
  board_print_out[index] = char_inp if index != -1
end
