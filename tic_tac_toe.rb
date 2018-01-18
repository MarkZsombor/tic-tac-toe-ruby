class Board
  def initialize
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  def print_board
  end

end

class Player
  attr_reader :symbol
  def initialize
    @symbol = rand.round == 0 ? "X" : "O"
    puts "You are #{@symbol}"
  end
end

class Game

  def self.main
    game = Game.new
    game.start_game
  end

  def initialize
    @game_board = Board.new
    @current_player = "X"
  end

  def show_instructions
    puts "Press the corresponding number to place your marker",
         "7 | 8 | 9",
         "- - - - -",
         "4 | 5 | 6",
         "- - - - -",
         "1 | 2 | 3",
         "First to get a line of 3 wins"
  end

  def start_game
    puts "Would you like to play Tic Tac Toe? (y/n)"
    gets.chomp == "y" ? self.show_instructions : start_game
    @player = Player.new
    @comp_symbol = @player.symbol == "X" ? "O" : "X"
    puts @player.symbol == "X" ? "You go first" : "Computer goes first"
  end

  def is_winner
  end

  def is_tie
  end
end

Game.main