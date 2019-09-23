class Board


  # Make new, empty board
  def initialize
    @cells = Array.new(9, " ")
  end

  # Cells reader
  def cells
    @cells
  end

  # Write to cells
  def cells=(array)
    @cells=array    
  end

  # Clear cells array
  def reset!
    self.cells = []
  end

  # Print board
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} ")
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} ")
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} ")
  end

  # Takes user input and returns value of board cell
  def position(input)
    self.cells[input-1]
  end

  def full?
  end

  def turn_count
  end

  def taken?
  end

  def valid_move?
  end

  def update
  end

end
