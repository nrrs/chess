require 'singleton'

module Slide
  def moves(direction)
    case direction
    when :diagonal
    when :horizontal
      # shift col value +-
    when :vertical
    when :both
    end
  end
end

module Step

end

class Piece

  def initialize(name, start_pos, color, board)
    @name = name
    @start_pos = start_pos
    @color = color
    @board = board
    @end_pos
  end

  def moves
    _valid_pos = []
  end

end

class SlidingPiece < Piece # Bishop/Rook/Queen

  include Slide

  def initialize(name, start_pos, color, board, direction)
    super
    @direction = direction
  end

  def move_dirs
    moves(@direction)
  end
end

class SteppingPiece < Piece
end

class NullPiece
  attr_reader :color, :symbol

  include Singleton

  def initialize
    @symbol = "_"
    @color = :red
  end
end

class Pawns < Piece
end
