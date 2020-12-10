# frozen_string_literal: true

require 'rspec'
require_relative 'day_7'

RSpec.describe do
  describe 'part 1' do
    it 'can parse a line with child bags' do
      input = 'light red bags contain 1 bright white bag, 2 muted yellow bags.'
      expected = {
        light_red: [{ name: :bright_white, num: 1 }, { name: :muted_yellow, num: 2 }]
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
      expect(Day7.parse(File.readlines('sample.txt'), {})).to eq(expected)
    end

    it 'passes with only one direct parent' do
      input = { bright_white: [{ name: :shiny_gold, num: 1 }] }
      expect(Day7.count_parents(input)).to eq(1)
    end

    it 'passes with two direct parents' do
      input = {
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [{ name: :shiny_gold, num: 2 }, { name: :faded_blue, num: 9 }],
        faded_blue: []
      }
      expect(Day7.count_parents(input)).to eq(2)
    end

    it 'passes when doing multiple hops' do
      input = {
        dark_orange: [{ name: :bright_white, num: 3 }, { name: :muted_yellow, num: 4 }],
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [],
        shiny_gold: []
      }
      expect(Day7.count_parents(input)).to eq(2)
    end

    it 'passes when both children can contain the gold bag' do
      input = {
        light_red: [{ name: :bright_white, num: 1 }, { name: :muted_yellow, num: 2 }],
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [{ name: :shiny_gold, num: 2 }],
        shiny_gold: []
      }
      expect(Day7.count_parents(input)).to eq(3)
    end

    it 'passes with the sample input' do
      input = {
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
      expect(Day7.count_parents(input)).to eq(4)
    end

    it 'passes with the sample input' do
      expect(Day7.part1(File.readlines('sample.txt'))).to eq(4)
    end

    it 'passes with the actual input' do
      expect(Day7.part1(File.readlines('actual.txt'))).to eq(205)
    end
  end

  describe 'part 2' do
    it 'passes with the sample input' do
      expect(Day7.part2(File.readlines('sample.txt'))).to eq(32)
    end

    it 'passes with the second sample input' do
      expect(Day7.part2(File.readlines('sample2.txt'))).to eq(126)
    end

    it 'passes with the actual input' do
      expect(Day7.part2(File.readlines('actual.txt'))).to eq(80_902)
    end
  end
end
