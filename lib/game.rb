# frozen_string_literal: true

# Require
require_relative('modules/user_inputs')

# Game Class, The one who runs the game
class Game
  include UserInputs

  def initialize(board)
    @turn = 0
    @players = []
    @board = nil

    @board = board
  end

  def register_player(player)
    @players.push(player)
  end

  def start # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    loop do
      @board.render_board
      puts "#{@players[@turn].name}'s Turn!"

      until @board.register_mark_symbol(enter_mark_location, @players[@turn].mark_symbol)
        puts 'That location is already marked.'
      end

      winner if @board.pattern_found?
      break if @board.cells_are_all_filled?

      @turn = (@turn + 1) % @players.length
    end

    @board.render_board
    puts 'Tie! No one wins!'
  end

  def winner
    @board.render_board

    puts "#{@players[@turn].name} is the Winner!".colorize(:yellow)
    exit(0)
  end
end
