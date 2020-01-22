require "pry"

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

   def position(user_input)
      cells[user_input.to_i - 1]
   end

   def full?
      cells.all? {|index| index == "X" || index == "O"}
   end

   def turn_count
      cells.count {|index| index == "X" || index == "O"}
   end

   def taken?(index)
      position(index) == "X" || position(index) == "O"
   end

   def valid_move?(input)
      input.to_i.between?(1,9) && !taken?(input)
   end

   def update(input, player)
      input = input.to_i
      cells[input - 1] = player.token
   end


end