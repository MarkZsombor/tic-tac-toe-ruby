class Board
  attr_reader :board
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
    puts "Press the corresponding number to choose your position",
         "   7 | 8 | 9",
         "   - - - - -",
         "   4 | 5 | 6",
         "   - - - - -",
         "   1 | 2 | 3",
         "First to get a line of 3 wins"
  end

  def start_game
    puts "Welcome to Tic Tac Toe"
    @p_marker = rand.round == 0 ? "X" : "O"
    puts "You are #{@p_marker}"
    @c_marker = @p_marker == "X" ? "O" : "X"
    self.show_instructions
    puts @p_marker == "X" ? "You go first" : "Computer goes first"
    until is_winner do
      place_marker(@current_player)
    #   puts "#{@current_player}'s turn"
    #   if @current_player == @c_marker
    #     comp_turn(@c_marker)
    #   else
    #     place_marker(@p_marker)
    #   end
      @current_player = @current_player == "X" ? "O" : "X"
    #   @game_board.print_board
    end
    if is_winner == "X" || "O"
      puts "#{is_winner} is the winner"
      puts is_winner == @p_marker ? "Congratulations" : "Better luck next time"
    else
      puts "Its a tie!"
    end
    @game_board.print_board
  end

  def is_winner
    # Check rows
    (0..2).each do |r|
      if @game_board.board[r][0] == @game_board.board[r][1] && @game_board.board[r][1] == @game_board.board[r][2] &&  @game_board.board[r][0] != " "
        return @game_board.board[r][0]
      end
    end
    # Check columns
    (0..2).each do |c|
      if @game_board.board[0][c] == @game_board.board[1][c] && @game_board.board[1][c] == @game_board.board[2][c] &&  @game_board.board[0][c] != " "
        return @game_board.board[0][c]
      end
    end
    # Check diagonal
      if @game_board.board[0][0] == @game_board.board[1][1] && @game_board.board[1][1] == @game_board.board[2][2] &&  @game_board.board[0][0] != " "
        return @game_board.board[0][0]
      end
      if @game_board.board[0][2] == @game_board.board[1][1] && @game_board.board[1][1] == @game_board.board[2][0] &&  @game_board.board[0][2] != " "
        return @game_board.board[0][2]
      end
    # Check for open spaces (tie)
    return "tie" if !open_spaces
    return false
  end

  def open_spaces
    @game_board.board.join.split('').include?(" ")
  end

  def place_marker(marker)
    @game_board.print_board
    good_input = false
    until good_input
      print "Please choose a position for your #{marker} "
      position = gets.chomp
      if valid_input(position)
        coords = convert_to_array_value(position.to_i)
        good_input = true if is_empty?(coords)
      end
    end
    @game_board.board[coords[0]][coords[1]] = marker
  end

  def valid_input(val)
    (1..9).include?(val.to_i)
  end

  def convert_to_array_value(int)
    case int
    when 1
      return [2,0]
    when 2
      return [2,1]
    when 3
      return [2,2]
    when 4
      return [1,0]
    when 5
      return [1,1]
    when 6
      return [1,2]
    when 7
      return [0,0]
    when 8
      return [0,1]
    when 9
      return [0,2]
    else
      puts "Invalid Input"
    end
  end

  def is_empty?(coords)
   @game_board.board[coords[0]][coords[1]] == " "
  end

  def comp_turn(marker)
    # Find a winning spot
    # Block a winning spot
    # Take a corner
    # Take the center
    # take an edge
  end

end

Game.main