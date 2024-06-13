# frozen_string_literal: true

# Require all the class!
require('colorize')
require_relative('lib/board')
require_relative('lib/player')
require_relative('lib/game')
require_relative('lib/modules/user_inputs')

# Init Objects!
board = Board.new
game = Game.new(board)

# Get Players
puts "===========================================\n
===== Welcome to my Tic Tac Toe Game! =====\n
===========================================\n".colorize(:yellow)

player_one = input_player_name(1)
game.register_player(Player.new(player_one, 'O'))

player_two = input_player_name(2)
game.register_player(Player.new(player_two, 'X'))

puts "\nWelcome, #{player_one} and #{player_two}!\nLet's begin!\n"

# Game Start!
game.start
