require_relative 'Board'
require_relative 'cursor.txt'
require 'colorize'

class Display

  attr_reader :cursor

  def initialize
    @cursor = Cursor.new([0, 0], board)
  end
end
