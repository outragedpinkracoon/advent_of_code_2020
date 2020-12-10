# frozen_string_literal: true

require 'rspec'
require_relative 'parser'

RSpec.describe do
  describe 'parser' do
    it 'can parse a line with child bags' do
      input = 'light red bags contain 1 bright white bag, 2 muted yellow bags.'
      expected = {
        light_red: [{ name: :bright_white, num: 1 }, { name: :muted_yellow, num: 2 }]
      }
      expect(Parser.parse_line(input, {})).to eq(expected)
    end

    it 'can parse a line with no child bags' do
      input = 'dotted black bags contain no other bags.'
      expected = {
        dotted_black: []
      }
      expect(Parser.parse_line(input, {})).to eq(expected)
    end

    it 'parses the sample input' do
      expected = {
        light_red: [{ name: :bright_white, num: 1 }, { name: :muted_yellow, num: 2 }],
        dark_orange: [{ name: :bright_white, num: 3 }, { name: :muted_yellow, num: 4 }],
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [{ name: :shiny_gold, num: 2 }, { name: :faded_blue, num: 9 }],
        shiny_gold: [{ name: :dark_olive, num: 1 }, { name: :vibrant_plum, num: 2 }],
        vibrant_plum: [{ name: :faded_blue, num: 5 }, { name: :dotted_black, num: 6 }],
        dark_olive: [{ name: :faded_blue, num: 3 }, { name: :dotted_black, num: 4 }],
        faded_blue: [],
        dotted_black: []
      }
      expect(Parser.run(File.readlines('sample.txt'), {})).to eq(expected)
    end
  end
end
