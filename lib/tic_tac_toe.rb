require 'pry'
class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS= [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    int = string.to_i - 1 
  end
  
  def move(ind, token = "x")
    @board[ind] = token 
  end
  def position_taken?(ind)
    @board[ind] == " "? false : true 
  end
  
  def valid_move?(ind)
    if ind > 9 || ind < 0 
      return false
    elsif @board[ind] != " "
      return false
    else
      return true 
    end
  end
  
  def turn_count
    sum = 0 
    @board.each do |pos|
      if pos != " "
        sum += 1 
      end
    end
    return sum
  end
    
  def current_player
    num = turn_count 
    if num % 2 == 0 
      return "X"
    else 
      return "O"
    end
  end
  
  def turn 
    puts "move 1-9: "
    turn = gets 
    val = input_to_index(turn)
    move = valid_move?(val)
    player = current_player
    if move
      move(val, player)
    else
      puts "invalid move 1-9:"
      move = gets
    end
    display_board
  
  end
  
  def won?
    winner =WIN_COMBINATIONS.find do |combo|
      
       @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"              ||
         
       @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    end
  end
  
  def full?
    num = turn_count
    num == 9 ? true: false 
  end 
  
  def draw?
    (!won? && full?)? true: false 
  end
  
  def over?
    (draw? || won?)? true: false 
  end
  
  def winner
    if won? 
      current_player == "X"? "O": "X"
    else
      return nil 
    end
  end
  
  def play
    while !over? do
      turn       
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end 
    
  end  
end