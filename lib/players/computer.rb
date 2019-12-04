module Players 
    class Players::Computer < Player 
        def move(board)
            board.cells.each_with_index do |cell, index|
                if cell == " "
                    position =  index + 1
                    return position.to_s 
                end 
            end       
        end     
       
    end      
end      