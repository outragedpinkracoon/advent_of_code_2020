# frozen_string_literal: true

require 'rspec'
require_relative 'day_7'
require_relative '../test_helper'

# rubocop:disable Style/SymbolArray
RSpec.describe do
  include TestHelper

  it 'can parse a line with child bags' do
    input = 'light red bags contain 1 bright white bag, 2 muted yellow bags.'
    expected = {
      light_red: [:bright_white, :muted_yellow]
    }
    expect(Day7.parse_line(input, {})).to eq(expected)
  end

  it 'can parse a line with no child bags' do
    input = 'dotted black bags contain no other bags.'
    expected = {
      dotted_black: []
    }
    expect(Day7.parse_line(input, {})).to eq(expected)
  end

  it 'parses the sample input' do
    expected = {
      light_red: [:bright_white, :muted_yellow],
      dark_orange: [:bright_white, :muted_yellow],
      bright_white: [:shiny_gold],
      muted_yellow: [:shiny_gold, :faded_blue],
      shiny_gold: [:dark_olive, :vibrant_plum],
      vibrant_plum: [:faded_blue, :dotted_black],
      dark_olive: [:faded_blue, :dotted_black],
      faded_blue: [],
      dotted_black: []
    }
    expect(Day7.parse(File.readlines('sample.txt'), {})).to eq(expected)
  end

  xit 'passes with only one direct parent' do
    input = { bright_white: [:shiny_gold] }
    expect(Day7.count_parents(input)).to eq(1)
  end

  it 'passes with two direct parents' do
    input = {
      bright_white: [:shiny_gold],
      muted_yellow: [:shiny_gold, :faded_blue]
    }
    expect(Day7.count_parents(input)).to eq(2)
  end
end
# rubocop:enable Style/SymbolArray
