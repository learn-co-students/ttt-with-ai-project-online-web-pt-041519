module Players 
    class Players::Computer < Player 
        # Basic strategy
        # def move(board)
        #     board.cells.each_with_index do |cell, index|
        #         if cell == " "
        #             position =  index + 1
        #             return position.to_s 
        #         end 
        #     end       
        # end     
       
        # More complicated strategy
        def move(board)
            # Set default move
            move = ""

            # Initial move: Take middle position if possible. Else take first corner position not taken.
            if board.turn_count == 1 || board.turn_count == 2
                !board.taken?(5) ? move = "5" :  move = [1, 3, 7, 9].find{|i| !board.taken?(i)}.to_s
            
            # If turn 3 or 4, take top middle position.
            elsif (board.turn_count == 3 || board.turn_count == 4) && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
                move = "2"
            
            # Later turns: Take open position starting from corner, moving to middle.
            else
                move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == ""
            end

            return move
        end
    end      
end      