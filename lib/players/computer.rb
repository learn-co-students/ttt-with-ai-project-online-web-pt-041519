class Players 
    class Computer < Player 
        def move(board)
            #should return a valid position. Any valid position?
            board.cells.each_with_index do |cell, index|
                if cell == " "
                    position =  index + 1
                    return position.to_s 
                end 
            end       
        end     
       
    end      
end      