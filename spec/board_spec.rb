# frozen_string_literal: true

require_relative('./../lib/board')

# Start
describe Board do
  describe '#cells_are_all_filled?' do
    subject(:cells) { described_class.new }

    context 'When all the cells are filled' do
      it 'returns true' do
        cell = [%w[X X X], %w[O O O], %w[O O X]]
        cells.board = cell

        expect(cells).to be_filled
      end
    end

    context 'When all the cells are NOT filled' do
      it 'returns false' do
        cell = [%w[X X X], [' ', ' ', ' '], %w[O O X]]
        cells.board = cell

        expect(cells).to_not be_filled
      end
    end
  end

  describe '#pattern_found?' do
    subject(:pattern) { described_class.new }

    context 'When Theres a pattern found on a current player turn' do
      it 'returns true' do
        cell = [['X', 'O', 'X'], ['O', 'X', 'O'], ['X', ' ', ' ']]
        pattern.board = cell

        expect(pattern).to be_pattern_found
      end
    end

    context 'When Theres no pattern on a current player turn' do
      it 'returns false' do
        cell = [%w[X O X], %w[O X O], %w[O X O]]
        pattern.board = cell

        expect(pattern).to_not be_pattern_found
      end
    end
  end

  describe '#get_cell_index' do
    let(:cell_code) { {'a': 0, '1': 0, 'b': 1, '2': 1, 'c': 2, '3': 2 } }
    subject(:retrieve_cell) { described_class.new }

    context 'When retrieving the index' do
      it 'returns 0 by :a' do
        input = 'a'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to eql(0)
      end
      it 'returns 1 by :b' do
        input = 'b'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to eql(1)
      end
      it 'returns 2 by :c' do
        input = 'c'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to eql(2)
      end
      it 'returns 0 by :1' do
        input = '1'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to eql(0)
      end
      it 'returns 1 by :2' do
        input = '2'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to eql(1)
      end
      it 'returns 2 by :3' do
        input = '3'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to eql(2)
      end
    end

    context 'When retrieving an unknown key' do
      it 'returns false' do
        input = 't'.to_sym
        get_cell = retrieve_cell.get_cell_index(input)
        expect(get_cell).to be_falsy
      end
    end
  end

  describe '#register_mark_symbol' do
    subject(:mark) { described_class.new }

    context 'Verify the returned value when marking a location' do
      it 'returns true to a valid location' do
        input = 'a1'
        register_mark = mark.register_mark_symbol(input, 'X')
        expect(register_mark).to be_truthy
      end

      it 'returns false to an invalid location (Taken)' do
        cell = [%w[X O X], %w[X O X], %w[X O X]]
        input = 'a1'

        mark.board = cell
        register_mark = mark.register_mark_symbol(input, 'X')

        expect(register_mark).to be_falsy
      end
    end

    context 'Verify what will happen to the board when marking a location' do
      before do
        cell = [%w[X O X], [' ', 'O', 'X'], %w[X O X]]
        mark.board = cell
      end

      it 'Sets correct mark placement on the board' do
        expected_output = [%w[X O X], %w[X O X], %w[X O X]]

        input = 'b1'
        register_mark = mark.register_mark_symbol(input, 'X')
        board = mark.board

        expect(board).to eql(expected_output)
      end
    end
  end
end
