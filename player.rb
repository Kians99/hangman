class Player

  attr_accessor :guesses_left, :already_guessed

  def initialize
    @guesses_left = 10
    @already_guessed = []
  end

  def make_guess
    guess = gets.chomp
  end
  def valid_guess(guess)
    guess.ord >= 65 && guess.ord <= 90 && guess.length == 1 ||
      guess.ord >= 97 && guess.ord <= 122 && guess.length == 1
  end
end

