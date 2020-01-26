
module Players
    class Players::Computer < Player
        def move(board)
            board.cells.each_with_index do |c, i|
                if c == " "
                    position = i + 1
                    return position.to_s
                end
            end
        end
    end
end