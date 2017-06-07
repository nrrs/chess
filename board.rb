require_relative 'piece'
require_relative 'display'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {} }
    populate_pieces


    Display.new(self)
  end

  def populate_pieces
    grid.each_index do |row|
      grid[row].each_index do |col|
        if (row.zero? || row == 1) ||
              (row == @grid.length - 1 || row == @grid.length - 2)
          grid[row][col] = 'X' #Piece.new
        else
          grid[row][col] = "_"
        end
      end
    end
  end

  alias_method :rows, :grid

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise 'THERE IS NO PIECE AT #{start_pos} FOR YOU TO MOVE.'
    elsif !self[end_pos].nil?
      raise 'YOU CANNOT MOVE TO #{end_pos}. THIS POSITION IS ALREADY TAKEN.'
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end

  def in_bounds(new_pos)
    x, y = new_pos
    bounds = (0..7).to_a

    return true if bounds.include?(x) && bounds.include?(y)
    false
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
  p game.move_piece([0, 0], [2, 0])
  # p game.grid
end
