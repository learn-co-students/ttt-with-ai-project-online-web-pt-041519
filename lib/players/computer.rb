require 'pry'

module Players
    class Computer < Player
        def move(board)
            input = rand(1..9).to_s until board.valid_move?(input)
            board.update(input, self)
            input
        end
    end
end