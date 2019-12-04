module Players 
    class Human < Player 
        def move(board)
            puts "Choose a board position between 1 and 9"
            input = gets.strip
            return input
        end 
    end      
end    