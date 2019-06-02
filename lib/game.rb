class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end

    def current_player
        self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win|
            if self.board.cells[win[0]] == self.board.cells[win[1]] && self.board.cells[win[1]] == self.board.cells[win[2]] && self.board.cells[win[0]] != " "
                return win
            end
        end
        false
    end

    def draw?
        self.board.full? && !self.won?
    end

    def over?
        self.won? || self.draw?
    end

    def winner
        return self.board.cells[won?[0]] if won?
        nil
    end

    def turn
        move = self.current_player.move(board)
    end

    def play
        self.turn until self.over?
        if self.draw?
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end
end