# frozen_string_literal: true

require('colorize')
require_relative('./../lib/game')
require_relative('./../lib/board')
require_relative('./../lib/player')

# Start
describe Game do
  subject(:game) { described_class.new(mock_board) }
  let(:mock_board) { instance_double(Board) }

  describe '#register_player' do
    let(:player) { double(Player) }

    context 'When adding a new Player' do
      it 'Adds to the player list' do
        game.register_player(player)
        players = game.players

        expect(players).to contain_exactly(player)
      end

      it 'Can handle multiple registration' do
        game.register_player(player)
        game.register_player(player)
        players = game.players

        expect(players).to contain_exactly(player, player)
      end
    end
  end

  describe '#winner' do
    let(:player) { instance_double(Player) }

    before do
      allow(player).to receive(:name).and_return('Player_Test')
      allow(mock_board).to receive(:render_board).and_return('')
      game.register_player(player)
    end

    context 'Display the winner' do
      it 'Outputs correct phrase' do
        winner_phrase = "#{player.name} is the Winner!".colorize(:yellow) << "\n"
        expect { game.winner }.to output(winner_phrase).to_stdout
      end
    end
  end
end
