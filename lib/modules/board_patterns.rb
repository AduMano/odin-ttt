# frozen_string_literal: true

# Board Patter Module
module BoardPattern
  def check_horizontally(board)
    board.each { |row| return true if row[0] == row[1] && row[1] == row[2] && row[0] != ' ' }
    false
  end

  def check_vertically(board)
    board.transpose.each { |row| return true if row[0] == row[1] && row[1] == row[2] && row[0] != ' ' }
    false
  end

  def top_left_to_bottom_right(board)
    if board[0][0] != ' ' &&
       board[0][0] == board[1][1] &&
       board[1][1] == board[2][2]
      return true
    end

    false
  end

  def top_right_to_bottom_left(board)
    if board[0][2] != ' ' &&
       board[0][2] == board[1][1] &&
       board[1][1] == board[2][0]
      return true
    end

    false
  end

  def display_pattern_row(row, index)
    flag_first_cell = true

    row.each do |mark|
      if flag_first_cell
        print " #{(index + 97).chr} | #{mark.eql?(' ') ? ' ' : get_mark_symbol_color(mark)} |"
      else
        print "| #{mark.eql?(' ') ? ' ' : get_mark_symbol_color(mark)} |"
      end

      flag_first_cell = false
    end
  end
end

def get_mark_symbol_color(mark)
  mark.eql?('O') ? mark.colorize(:blue) : mark.colorize(:red)
end
