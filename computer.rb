class Computer

  attr_accessor :comp_selected_word

  def initialize
    @comp_selected_word = File.open('5desk.txt', 'r').readlines.sample.chomp
  end

  def length
    comp_selected_word.length
  end

end


