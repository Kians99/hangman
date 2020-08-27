require_relative 'computer'

class Board

  attr_accessor :letters, :board_print_out, :hidden_word

  def initialize(hidden_word)
    @hidden_word = hidden_word
    @board_print_out = Array.new(hidden_word.length, '_ ')
  end

  def print_board
    puts "\n"
    board_print_out.each { |char| print char }
    print "\n"
  end

  def change_board(array_of_indices, char_inp) 
    array_of_indices.each do |index|
      if index == 0 
        board_print_out[index] = char_inp.upcase + " "
      else 
        board_print_out[index] = char_inp + " "
      end
    end
    print_board
  end

  def contains_character?(char_inp)
    hidden_word.chars.each_index.select{ |indx| hidden_word.chars[indx] == char_inp }
  end
    

end

