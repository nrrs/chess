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
    row_start, col_start = start_pos
    row_end, col_end = end_pos
    start_move = board[row_start][col_start]
    end_move = board[row_end][col_end]

    if start_move.nil?
      raise 'THERE IS NO PIECE AT #{start_pos} FOR YOU TO MOVE.'
    elsif !end_move.nil?
      raise 'YOU CANNOT MOVE TO #{end_pos}. THIS POSITION IS ALREADY TAKEN.'
    else
      @board[row_end][col_end] = start_move
      @board[row_start][col_start] = nil
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
  p game.move_piece([0,0], [3,0])
  p game.board
end
