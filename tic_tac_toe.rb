class Board
  def initialize
    @board = Array.new(3) { Array.new(3, " ")}
  end

  def print_board
    # puts @board[1][1]
    (0..2).each do |r|
      (0..2).each do |c|
        print @board[r][c]
        print " | " unless c == 2
      end
      puts "\n- - - - -" unless r == 2
    end
    print "\n"
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
         "   7 | 8 | 9",
         "   - - - - -",
         "   4 | 5 | 6",
         "   - - - - -",
         "   1 | 2 | 3",
         "First to get a line of 3 wins"
  end

  def start_game
    puts "Welcome to Tic Tac Toe"
    @player = Player.new
    @comp_symbol = @player.symbol == "X" ? "O" : "X"
    self.show_instructions
    puts @player.symbol == "X" ? "You go first" : "Computer goes first"
    # @game_board.print_board
  end

  def is_winner
  end

end

Game.main