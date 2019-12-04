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

  # # Return winning array if @board.cells indices match WIN_COMBINATIONS; otherwise return false
  # def won?
  #   # Build hash of x and o indices
  #   indices_hash = {}
  #   @board.cells.each_with_index.reduce(0) do |memo, (value, index)|
  #     indices_hash[value] ||= []
  #     indices_hash[value] << index
  #     indices_hash
  #   end

  #   # Return array if intersection of winnning combo and X or O array matches a winning combo
  #   WIN_COMBINATIONS.each { |combo| return combo if combo & indices_hash["X"] == combo || combo & indices_hash["O"] == combo }

  #   # Otherwise return false
  #   return false 
  # end

  # Return hash of x and o indices
  def board_hash
    indices_hash = {}
    @board.cells.each_with_index.reduce(0) do |memo, (value, index)|
      indices_hash[value] ||= []
      indices_hash[value] << index
      indices_hash
    end

    return indices_hash
  end

  # Return winning array if @board.cells indices match WIN_COMBINATIONS; otherwise return false
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  # Return true if board is full but not won
  def draw?
    @board.full? && !won?
  end

  # Return true for draw or won
  def over?
    draw? || won?
  end

  # Return token of winner, else return nil
  def winner
    !!won? ? @board.cells[won?[0]]: nil
  end
  
  # If current player has valid move, update board
  def turn
    player = current_player
    current_move = player.move(@board)

    # Restart turn if invalid move
    if !@board.valid_move?(current_move)
      turn
    # Display current board, update move, then display board again
    else
      puts "\n----\nTurn: #{@board.turn_count+1}\n"
      # @board.display
      @board.update(current_move, player)
      puts "#{player.token} played position #{current_move}\n\n"
      @board.display
      puts "\n\n"
    end
  end

  # Play each turn until game is over. Display message if won or draw
  def play
    # Display initial board
    @board.display
    puts "\n"

    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  # Start new game
  def start
    # Get computer or human players
    puts "\nWhat kind of game would you like to play? Select \n 0 for computer-only players \n 1 to play against the computer \n 2 to play against another person."
    game_type = gets.strip

    # Set new game type based on input
    case game_type
      when "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      when "1"
        puts "\nWould you like to go first? You'll be 'X'"
        go_first = gets.strip.downcase
        if go_first == "y" || go_first == "yes"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        else
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        end
      when "2"
        puts "\nX will go first. Get ready!"
        game = Game.new
      else
        puts "That game type wasn't recognized, so we'll have computer-only players."
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    end

    # Play game
    game.play
    until game.over?
      game.play
    end
  end
  
  # Prompt user to play again. Start new game if yes
  def play_again?
    play_again = ""
    until play_again.downcase == "n" || play_again.downcase == "no"
      puts "\nWould you like to play again?"
      play_again = gets.strip.downcase
      if play_again.downcase == "y" || play_again.downcase == "yes"
        start
      end
    end
  end

end
