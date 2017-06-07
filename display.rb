require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display

  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
    render
  end

  def render
    while true
      current_cursor = @cursor.cursor_pos

      puts
      puts
      puts "-----------------------"
      board.rows.each_with_index do |row, row_idx|
        row.each_with_index do |piece, piece_idx|
          colorize_piece(current_cursor, row_idx, piece_idx)
        end
        puts
      end
      puts "-----------------------"
      puts
      puts

      @cursor.get_input
    end
  end

  def colorize_piece(cursor, row, piece)
    current_piece = board[[row, piece]]

    if cursor == [row, piece]
      print " #{current_piece.colorize(background: :blue)} "
    else
      print " #{current_piece} "
    end
  end


end
