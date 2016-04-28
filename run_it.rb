require './menu.rb'
require './playgame.rb'

class RunIt
    menu = Menu.new
    menu.welcome_game
    menu.process_input
end
