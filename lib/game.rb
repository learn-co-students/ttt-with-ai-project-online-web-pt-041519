class Game
  attr_accessor :board, :player_1, :player_2

  # All possible winning combos
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # Start new game with 2 players
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end 

  # Return token of current player at 3rd move
  def current_player
    @board.turn_count.even? ? (return @player_1) : (return @player_2)
  end

  # Return winning array if @board.cells indices match WIN_COMBINATIONS; otherwise return false
  def won?
    # Build hash of x and o indices
    indices_hash = {}
    @board.cells.each_with_index.reduce(0) do |memo, (value, index)|
      indices_hash[value] ||= []
      indices_hash[value] << index
      indices_hash
    end

    # Return array if intersection of winnning combo and X or O array matches a winning combo
    WIN_COMBINATIONS.each { |combo| return combo if combo & indices_hash["X"] == combo || combo & indices_hash["O"] == combo }

    # Otherwise return false
    return false 
  end

  def draw?
  end

  def over?
  end

  def winner
  end
  
  def turn
  end

  def play
  end





end
