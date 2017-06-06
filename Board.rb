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

  def [](row_input, col_input)
    row, col = row_input, col_input
    board[row][col]
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
end
