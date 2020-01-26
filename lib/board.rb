require 'pry'

class Board
    attr_accessor :cells

    def reset!
        self.cells = Array.new(9, " ")
    end

    def initialize
        reset!
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        cells.all? {|i| i == "X" || i == "O"}
    end

    def turn_count
        cells.count {|i| i == "X" || i == "O"}
    end

    def taken?(idx)
        position(idx) == "X" || position(idx) == "O"
    end

    def valid_move?(player_input)
        player_input.to_i.between?(1,9) && !taken?(player_input)
        
    end

    def update(player_input, player)
        player_input = player_input.to_i
        cells[player_input - 1] = player.token
    end
end
