require_relative 'Piece'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) {} }
    board.each_index do |row|
      board[row].each_index do |col|
        if (row.zero? || row == 1) ||
              (row == @board.length - 1 || row == @board.length - 2)
          board[row][col] = Piece.new
        else
          board[row][col] = nil
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    board[row][col] = piece
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

end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
  game[[0, 0]]
  p game.move_piece([0,0], [0,2])
  p game.board
end
