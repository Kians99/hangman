class Player

  attr_accessor :guesses_left, :already_guessed, :correctly_guessed, :all_guesses

  def initialize(length_of_hidden_word)
    @guesses_left = length_of_hidden_word * 2
    @already_guessed = []
    @correctly_guessed = []
    @all_guesses = []
  end

  def make_guess
    gets.chomp
  end

  def add_guess(guess)
    already_guessed.push(guess)
  end

  def valid_guess(guess)
    return false if guess == ""
    guess.ord >= 65 && guess.ord <= 90 && guess.length == 1 ||
      guess.ord >= 97 && guess.ord <= 122 && guess.length == 1
  end
end

