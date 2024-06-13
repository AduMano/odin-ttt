# frozen_string_literal: true

# Class for instantiating players
class Player
  attr_reader :name, :mark_symbol

  def initialize(name, mark_symbol)
    @name = name
    @mark_symbol = mark_symbol
  end
end
