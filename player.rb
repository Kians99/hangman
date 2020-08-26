class Player

  attr_accessor :guesses_left

  def initialize
    @guesses_left = 10
  end

  def make_guess
    guess = gets.chomp
    guess.ord >= 65 && guess.ord <= 90 && guess.length == 1 ||
      guess.ord >= 97 && guess.ord <= 122 && guess.length == 1
  end






end

