require_relative 'Board'
require_relative 'cursor'
require 'colorize'

class Display

  attr_reader :cursor

  def initialize
    @cursor = Cursor.new([0, 0], board).colorize(:blue)
  end
end
