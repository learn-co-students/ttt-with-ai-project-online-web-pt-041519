class Board
  attr_accessor :cells

  # Make 9 cell empty board
  def initialize
    @cells = Array.new(9, " ")
  end

  # Clear cells array
  def reset!
    self.cells = Array.new(9, " ")
  end

  # Print board
  def display
    index = 0
    while index < 9
      puts " #{self.cells[index]} | #{self.cells[index + 1]} | #{self.cells[index + 2]} "
      puts "-----------"
      index += 3
    end
    
    # puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    # puts "-----------"
    # puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    # puts "-----------"
    # puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  # Convert input to integer
  def convert_to_i(input)
    input.to_i
  end

  # Convert user input into array index
  def input_to_index(input)
    self.convert_to_i(input) - 1
  end

  # Return value of cell from position input
  def position(input)
    self.cells[self.input_to_index(input)]
  end

  # Return true if cells have no spaces
  def full?
    !self.cells.include?(" ")
  end

  # Return amount of turns taken based on count of full cells
  def turn_count
    self.cells.reject{|cell| cell.include?(" ")}.count
  end

  # Return true if position is X or O
  def taken?(input_position)
    self.position(input_position) == "X" || self.position(input_position) == "O"
  end

  # Return true if user input is between 1-9 and is not taken 
  def valid_move?(input_position)
    num = self.convert_to_i(input_position)
    num.between?(1, 9) && !self.taken?(num)
  end

  # Update cell with input token if position not taken
  def update(position, player)
    self.cells[self.input_to_index(position)] = player.token if !self.taken?(self.convert_to_i(position))
  end

end