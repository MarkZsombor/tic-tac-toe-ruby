class Board
  def initialize
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  def print_board
  end

  def is_winner
  end
end

class Player
  def initialize
    @symbol = rand.round == 0 ? "X" : "O"
    puts "You are #{@symbol}"
  end
end

class Game
  def initialize
    @player = Player.new
    @game_board = Board.new
  end


end

def start_game
  puts "Would you like to play Tic Tac Toe? (y/n)"
  gets.chomp == "y" ? game = Game.new : start_game
end

start_game