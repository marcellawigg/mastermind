require './timer.rb'
require './past_guesses.rb'
require './menu.rb'

class PlayGame
  def initialize
    @play = true
    @timer = Timer.new
    @secret = secret
    @past_guess = Past_Guesses.new
  end

  def secret
    random_numbers = 4.times.map{Random.rand(0..3) }
    colors = ["R","G","B","Y"]
    random_numbers.map { |z| colors[z] }.join
  end

  def start_game
    puts "I'm generating a beginner sequence of four characters of (r)ed, (g)reen, (b)lue, and (y)ellow. Begin guessing now. Use (q)uit at any time to end the game and (c)heat to cheat. What's your guess?"
    @timer.start_time
    while @play == true
      guess = obtain_guess
      analyze_guess(guess)
    end
  end

  def back_menu
    menu = Menu.new
    menu.process_input
  end

  def obtain_guess
    gets.chomp.upcase
  end

  def quit(input)
    if input.include?("Q") == true || input.upcase == "QUIT"
      puts "You've opted to exit the game."
      @play == false
      back_menu
    end
  end

  def cheat(input)
    if input.include?("C") == true || input == "CHEAT"
      puts "You've chosen to cheat! Here's the secret code: #{@secret}."
      @play == false
      back_menu
    end
  end

  def analyze_guess(guess)
    @past_guess.add_guess
    @timer.end_time
    cheat_quit(guess)
    if guess.length != 4
      puts "Invalid guess! please try again."
    else
      compare_guess(guess)
    end
  end

  def compare_guess(guess)
    if guess == @secret
      correct_guess
    else
      incorrect_guess(guess)
    end
  end

  def correct_guess(guess)
    puts "Perfect! You have correctly guess the code in #{@past_guess.total_guess} tries in #{@timer.minutes} minutes, #{@timer.seconds} seconds."
    @play = false
  end

  def incorrect_guess(guess)
    puts "'#{(guess)}' has #{letters_correct(guess)} element(s) correct, with #{correct_position(guess)} in the right position(s). You have taken #{@past_guess.total_guess} turns over the course of #{@timer.minutes} minutes, #{@timer.seconds} seconds."
  end

  def cheat_quit(guess)
    cheat(guess)
    quit(guess)
  end

  #find number of correct elements
  def letters_correct(guess)
    @secret.chars.inject(0) do |count,letter|
      count += 1 if guess.chars.include? letter
      count
    end
  end

  # #find number of elements in correct positions
  def correct_position(guess)
    (0..3).inject(0) do |corr_pos,i|
      corr_pos+= 1 if guess.chars[i] == @secret.chars[i]
      corr_pos
    end
  end
end
