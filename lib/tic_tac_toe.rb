class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]

  attr_accessor :board

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    if index >= 0 && index <= 8 && position_taken?(index) != true
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = input_to_index(gets)
    while valid_move?(input) == false
      puts "Please enter 1-9:"
      input = input_to_index(gets)
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    @board.select{|space| space != " "}.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    match = WIN_COMBINATIONS.find do |combination|
      board[combination[0]] != " " &&
      board[combination[0]] == board[combination[1]] &&
      board[combination[0]] == board[combination[2]]
    end
    match != nil ? match : false
  end

  def full?
    turn_count == 9
  end

  def draw?
    full? && won? == false
  end

  def over?
    won? != false || draw?
  end

  def winner
    if won? != false
      current_player == "X" ? "O" : "X"
    else
      nil
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end