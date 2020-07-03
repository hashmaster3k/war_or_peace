require './lib/turn'
require 'pry'

def setup_deck
  card1 = Card.new(:heart, 'Ace', 1)
  card2 = Card.new(:heart, '2', 2)
  card3 = Card.new(:heart, '3', 3)
  card4 = Card.new(:heart, '4', 4)
  card5 = Card.new(:heart, '5', 5)
  card6 = Card.new(:heart, '6', 6)
  card7 = Card.new(:heart, '7', 7)
  card8 = Card.new(:heart, '8', 8)
  card9 = Card.new(:heart, '9', 9)
  card10 = Card.new(:heart, '10', 10)
  card11 = Card.new(:heart, 'Jack', 11)
  card12 = Card.new(:heart, 'Queen', 12)
  card13 = Card.new(:heart, 'King', 13)

  card14 = Card.new(:diamond, 'Ace', 1)
  card15 = Card.new(:diamond, '2', 2)
  card16 = Card.new(:diamond, '3', 3)
  card17 = Card.new(:diamond, '4', 4)
  card18 = Card.new(:diamond, '5', 5)
  card19 = Card.new(:diamond, '6', 6)
  card20 = Card.new(:diamond, '7', 7)
  card21 = Card.new(:diamond, '8', 8)
  card22 = Card.new(:diamond, '9', 9)
  card23 = Card.new(:diamond, '10', 10)
  card24 = Card.new(:diamond, 'Jack', 11)
  card25 = Card.new(:diamond, 'Queen', 12)
  card26 = Card.new(:diamond, 'King', 13)

  card27 = Card.new(:spade, 'Ace', 1)
  card28 = Card.new(:spade, '2', 2)
  card29 = Card.new(:spade, '3', 3)
  card30 = Card.new(:spade, '4', 4)
  card31 = Card.new(:spade, '5', 5)
  card32 = Card.new(:spade, '6', 6)
  card33 = Card.new(:spade, '7', 7)
  card34 = Card.new(:spade, '8', 8)
  card35 = Card.new(:spade, '9', 9)
  card36 = Card.new(:spade, '10', 10)
  card37 = Card.new(:spade, 'Jack', 11)
  card38 = Card.new(:spade, 'Queen', 12)
  card39 = Card.new(:spade, 'King', 13)

  card40 = Card.new(:club, 'Ace', 1)
  card41 = Card.new(:club, '2', 2)
  card42 = Card.new(:club, '3', 3)
  card43 = Card.new(:club, '4', 4)
  card44 = Card.new(:club, '5', 5)
  card45 = Card.new(:club, '6', 6)
  card46 = Card.new(:club, '7', 7)
  card47 = Card.new(:club, '8', 8)
  card48 = Card.new(:club, '9', 9)
  card49 = Card.new(:club, '10', 10)
  card50 = Card.new(:club, 'Jack', 11)
  card51 = Card.new(:club, 'Queen', 12)
  card52 = Card.new(:club, 'King', 13)

  main_deck = [card1, card2, card3, card4, card5,
               card6, card7, card8, card9, card10,
               card11, card12, card13, card14, card15,
               card16, card17, card18, card19, card20,
               card21, card22, card23, card24, card25,
               card26, card27, card28, card29, card30,
               card31, card32, card33, card34, card35,
               card36, card37, card38, card39, card40,
               card41, card42, card43, card44, card45,
               card46, card47, card48, card49, card50,
               card51, card52]

  main_deck.shuffle!

  @deck1 = Deck.new(main_deck.slice(0, 26))
  @deck2 = Deck.new(main_deck.slice(27, 52))
end

def setup_players
  @player1 = Player.new("Megan", @deck1)
  @player2 = Player.new("Aurora", @deck2)
end

def welcome_message
  puts "Welcome to War! (or Peace) This game will be played with 52 cards."
  puts "The players today are Megan and Aurora"
  puts "Type 'GO' to start the game or 'EXIT' to quit."
end

def play_game
  turn = Turn.new(@player1, @player2)

  turn_counter = 1

  until @player1.has_lost? || @player2.has_lost?
    if turn.type == :basic
      turn.winner
      turn.pile_cards
        puts "Turn #{turn_counter}: #{turn.winner.name} won #{turn.spoils_of_war.length} cards."
      turn.award_spoils
      turn_counter += 1
    elsif turn.type == :war
      turn.winner
      turn.pile_cards
        puts "Turn #{turn_counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.length} cards."
      turn.award_spoils
      turn_counter += 1
    elsif turn.type == :mutually_assured_destruction
      turn.pile_cards
      puts "Turn #{turn_counter}: *mutually assured destruction* - 6 cards removed from play"
      turn_counter += 1
    elsif turn.type == :lost1
      puts "#{@player1.name} ran out of cards!"
      puts "*~*~*~* #{@player2.name} has won the game *~*~*~*"
      break
    elsif turn.type == :lost2
      puts "#{@player2.name} ran out of cards!"
      puts "*~*~*~* #{@player1.name} has won the game *~*~*~*"
      break
    end
    break if turn_counter == 1000000
  end

  #print winner statement after player has won game
  if @player1.has_lost?
    puts "*~*~*~* #{@player2.name} has won the game *~*~*~*"
  elsif @player2.has_lost?
    puts "*~*~*~* #{@player1.name} has won the game *~*~*~*"
  elsif turn_counter == 1000000
    puts "---- DRAW ----"
  end

end #end of play_game

#--------------------------------------------------------

welcome_message

exit_condition = false

until exit_condition == true
  puts "------------------------------------------------------------------"

  print "\nPROMPT: "
  user_input = gets.chomp.upcase

  if user_input == "GO"
    setup_deck
    setup_players
    play_game
  elsif user_input == "EXIT"
    puts "\nThanks for playing! Bye!"
    exit_condition == true
    break
  else
    puts "\nInvalid input! Try again."
  end
end
