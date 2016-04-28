require './past_guesses'

class Secret
  attr_reader :secret
  def initialize
    @difficulty = ''
    @past_guesses = Past_Guesses.new
    @secret = secret_generator
  end

  def secret_generator
    secret_decider
  end

  def get_difficulty
    puts "How difficult would you like this game to be? I can make it harder or easier, depending upon your skill level. Type (b)eginner, (i)ntermediate, or (a)dvanced to indicate your skill level."
    @difficulty = gets.chomp.upcase
  end

  def secret_decider
    if @difficulty.include? "B" || @difficulty == "BEGINNER"
      puts "I'm generating a beginner sequence of four characters of (r)ed, (g)reen, (b)lue, and (y)ellow. Begin guessing now."
      beginner_secret
    elsif @difficulty.include? "I" || @difficulty == "INTERMEDIATE"
      puts "I am adding an extra color into the mix! Now, you will have to guess a six-letter sequence made up of (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range."
      intermediate_secret
    elsif @difficulty.include? "A" || @difficulty == "ADVANCED"
      puts "You say you're a pro! We'll see about that! Now, you will have to guess an eight-letter sequence made up of (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (v)iolet."
      advanced_secret
    end
  end

  def beginner_secret
    random_numbers = 4.times.map{Random.rand(0..3) }
    colors = ["R","G","B","Y"]
    random_numbers.map { |z| colors[z] }.join
  end

  def intermediate_secret
    random_numbers = 6.times.map{Random.rand(0..5)}
    colors = ["R","G","B","Y","O"]
    random_numbers.map { |z| colors[z].join }.join
  end


  def advanced_secret
    random_numbers = 8.times.map{Random.rand(0..7)}
    colors = ["R","G","B","Y","O","V"]
    random_numbers.map { |z| colors[z] }.join
  end

  def invalid_input
    while @difficulty.include?("B") == false && @difficulty.include?("I") == false && @difficulty.include?("A") == false
      puts "I didn't get that. Try again!"
    end
  end

  def return_secret
    @secret
  end

  def difficulty_length
    if beginner_secret
      4
    elsif intermediate_secret
      6
    elsif advanced_secret
      8
    end
  end
end
