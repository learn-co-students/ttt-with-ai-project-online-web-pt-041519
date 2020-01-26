class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        
        @player_1 = player_1
        @player_2 = player_2
        @board = board

    end

    def current_player
        if @board.turn_count.even?
            return @player_1
        else
            return @player_2
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |cell_content|
            @board.cells[cell_content[0]] == @board.cells[cell_content[1]] &&
            @board.cells[cell_content[1]] == @board.cells[cell_content[2]] &&
            @board.taken?(cell_content[0] + 1)
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        !!won? ? @board.cells[won?.first] : nil
    end

    def turn
        player = current_player
        move = player.move(@board)
        puts "#{player.token}'s turn. Press 1 - 9 to play."
        if !@board.valid_move?(move)
            turn
        else
            puts "Turn: #{@board.turn_count+1}"
            @board.update(move, player)
            @board.display
        end
    end

    def play
        @board.display
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end



end