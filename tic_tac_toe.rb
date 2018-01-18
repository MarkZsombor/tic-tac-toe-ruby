class Board
  def initialize
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  def print_board
  end
end



class Player
  def initialize
    @symbol = rand.round == 0 ? "X" : "O"
    puts "You are #{@symbol}"
  end
end
