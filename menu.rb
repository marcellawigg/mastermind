3require './playgame.rb'
#require './timer.rb'
class Menu

  def welcome_game
    puts %q{Welcome to
  ___ ___   ____  _____ ______    ___  ____   ___ ___  ____  ____   ___
  |   T   T /    T/ ___/|      T  /  _]|    \ |   T   Tl    j|    \ |   \
  | _   _ |Y  o  (   \_ |      | /  [_ |  D  )| _   _ | |  T |  _  Y|    \
  |  \_/  ||     |\__  Tl_j  l_jY    _]|    / |  \_/  | |  | |  |  ||  D  Y
  |   |   ||  _  |/  \ |  |  |  |   [_ |    \ |   |   | |  | |  |  ||     |
  |   |   ||  |  |\    |  |  |  |     T|  .  Y|   |   | j  l |  |  ||     |
  l___j___jl__j__j \___j  l__j  l_____jl__j\_jl___j___j|____jl__j__jl_____j
}
  end

  def menu_input
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    gets.chomp.upcase
  end

  def game(input)
    if input == "P" || input == "PLAY"
      game = PlayGame.new
      game.secret
      game.start_game
    end
  end

  def instructions(input)
    if input == "I" || input == "INSTRUCTIONS"
      puts "I will generate a random code of four different colors: (r)ed, (g)reen, (b)lue, and (y)ellow. Duplicates are possible. You will guess then guess the pattern by typing in the first letter of each, and continue guessing until you succeed at matching the code. Typing (c)heat will allow you to view the code quickly, and typing (q)uit will take you out of the game to the menu."
      process_input
    end
  end

  def quit(input)
    if input == "Q" || input == "QUIT"
      puts "I hate to see you go, but it's been fun! Have a nice day."
      exit
    end
  end

  def not_recognized(input)
    while input.include?("I") == false && input.include?("P") == false && input.include?("Q") == false
      puts "Sorry, I didn't recognize your input! Please re-enter."

    end
  end

  def process_input
    input = menu_input
    game(input)
    instructions(input)
    quit(input)
    not_recognized(input)
  end
end
