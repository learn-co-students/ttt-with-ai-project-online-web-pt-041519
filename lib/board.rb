require 'pry'

class Board
    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        self.cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        self.cells[input.to_i-1]
    end

    def full?
        self.cells.all? {|val| val == "X" || val == "O"}
    end

    def turn_count
        self.cells.count {|x| x != " "}
    end

    def taken?(input)
        position(input) == " " ? false : true
    end

    def valid_move?(input)
        (1..9).include?(input.to_i) && taken?(input) == false ? true : false 
    end

    def update(input, player)
        self.cells[input.to_i-1] = player.token if valid_move?(input)
    end
end