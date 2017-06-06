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

  def move_piece(start_pos)
    row, col = start_pos
    p board[row][col]
    if board[row][col].nil?
      raise 'There is no piece at #{start_pos}'
    else
      puts 'Where do you want to go?'
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
  p game.move_piece([0,0])
end
