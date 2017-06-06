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
    cur_cur = @cursor.cursor_pos

    board.rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if piece.nil?
          print " _ "
          next
        end

        if cur_cur == [i, j]
          print " #{piece.colorize(background: :green)} "
        else
          print " #{piece} "
        end
      end

      puts
    end
  end

end
