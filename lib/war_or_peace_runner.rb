require './lib/start'

#creates a new game and sets up the players
game = Start.new
game.setup

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
