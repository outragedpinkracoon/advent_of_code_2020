# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  describe 'part 1' do
    it 'passes with only one direct parent' do
      input = { bright_white: [{ name: :shiny_gold, num: 1 }] }
      expect(Part1.count_parents(input)).to eq(1)
    end

    it 'passes with two direct parents' do
      input = {
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [{ name: :shiny_gold, num: 2 }, { name: :faded_blue, num: 9 }],
        faded_blue: []
      }
      expect(Part1.count_parents(input)).to eq(2)
    end

    it 'passes when doing multiple hops' do
      input = {
        dark_orange: [{ name: :bright_white, num: 3 }, { name: :muted_yellow, num: 4 }],
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [],
        shiny_gold: []
      }
      expect(Part1.count_parents(input)).to eq(2)
    end

    it 'passes when both children can contain the gold bag' do
      input = {
        light_red: [{ name: :bright_white, num: 1 }, { name: :muted_yellow, num: 2 }],
        bright_white: [{ name: :shiny_gold, num: 1 }],
        muted_yellow: [{ name: :shiny_gold, num: 2 }],
        shiny_gold: []
      }
      expect(Part1.count_parents(input)).to eq(3)
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
      expect(Part1.count_parents(input)).to eq(4)
    end

    it 'passes with the sample input' do
      expect(Part1.run(File.readlines('sample.txt'))).to eq(4)
    end

    it 'passes with the actual input' do
      expect(Part1.run(File.readlines('actual.txt'))).to eq(205)
    end
  end
end
