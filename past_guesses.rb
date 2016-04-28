class Past_Guesses
    def initialize
      @num_guesses = 0
    end

  def add_guess
    @num_guesses += 1
  end

  def total_guess
    @num_guesses
  end
end
