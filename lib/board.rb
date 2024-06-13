# frozen_string_literal: true

# Require Colorize!
require('colorize')
require_relative('modules/board_patterns')

# Class for Board Setting
class Board
  include BoardPattern

  def initialize
    @board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    @cell_code = {
      'a': 0, '1': 0,
      'b': 1, '2': 1,
      'c': 2, '3': 2
    }
  end

  def render_board
    puts ''
    puts ' * . 1 .. 2 .. 3 .'

    @board.each_with_index do |row, index|
      display_pattern_row(row, index)

      puts ''
    end

    puts ''
  end

  def cells_are_all_filled?
    @board.flatten.none? { |cell| cell.eql?(' ') }
  end

  def pattern_found?
    return true if check_horizontally(@board)
    return true if check_vertically(@board)
    return true if top_left_to_bottom_right(@board)
    return true if top_right_to_bottom_left(@board)

    false
  end

  def get_cell_index(character)
    @cell_code[character.to_sym]
  end

  # Check if Cell is selected already
  def register_mark_symbol(location, mark)
    character = location.split('')
    row = get_cell_index(character[0])
    column = get_cell_index(character[1])

    if @board[row][column].eql?(' ')
      @board[row][column] = mark
      return true
    end

    false
  end
end
