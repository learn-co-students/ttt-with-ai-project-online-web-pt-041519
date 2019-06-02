module Players
    class Human < Player
        def move(board)
            input = nil
            until input.to_i.between?(1,9) do
                puts "Please enter a position between 1 and 9: "
                input = gets.strip
            end
            board.update(input, self)
            input
        end
    end
end