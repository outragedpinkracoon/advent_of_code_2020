# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  describe 'run' do
    it 'works on the first sample input' do
      expect(Part2.run(File.readlines('sample_3.txt'))).to eq(2)
    end

    it 'works on the second sample input' do
      expect(Part2.run(File.readlines('sample_4.txt'))).to eq(4)
    end

    it 'works on the sample input from the puzzle' do
      expect(Part2.run(File.readlines('sample_1.txt'))).to eq(8)
    end

    it 'works on the larger sample input from the puzzle' do
      expect(Part2.run(File.readlines('sample_5.txt'))).to eq(19_208)
    end
  end

  describe 'create combos' do
    it 'works on first sample input' do
      input = {
        0 => [1, 2],
        1 => [2],
        2 => [5],
        5 => []
      }
      expect(Part2.create_combos(input)[:data]).to match_array([[0, 1, 2, 5], [0, 2, 5]])
    end

    it 'works on second sample input' do
      input = {
        0 => [1, 2, 3],
        1 => [2, 3],
        2 => [3],
        3 => [6],
        6 => []
      }
      expected = [[0, 1, 2, 3, 6], [0, 1, 3, 6], [0, 2, 3, 6], [0, 3, 6]]
      expect(Part2.create_combos(input)[:data]).to match_array(expected)
    end

    it 'works on third sample input' do
      input = {
        0 => [1, 2],
        1 => [2, 4],
        2 => [4, 5],
        4 => [5],
        5 => []
      }
      expected = [
        [0, 1, 2, 4, 5],
        [0, 1, 4, 5],
        [0, 2, 4, 5],
        [0, 1, 2, 5],
        [0, 2, 5]
      ]
      expect(Part2.create_combos(input)[:data]).to match_array(expected)
    end

    it 'works on the first sample from the puzzle' do
      input = {
        0 => [1],
        1 => [4],
        4 => [5, 6, 7],
        5 => [6, 7],
        6 => [7],
        7 => [10],
        10 => [11, 12],
        11 => [12],
        12 => [15],
        15 => [16],
        16 => [19],
        19 => [22],
        22 => []
      }
      expected = [
        [0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19, 22],
        [0, 1, 4, 5, 6, 7, 10, 12, 15, 16, 19, 22],
        [0, 1, 4, 5, 7, 10, 11, 12, 15, 16, 19, 22],
        [0, 1, 4, 5, 7, 10, 12, 15, 16, 19, 22],
        [0, 1, 4, 6, 7, 10, 11, 12, 15, 16, 19, 22],
        [0, 1, 4, 6, 7, 10, 12, 15, 16, 19, 22],
        [0, 1, 4, 7, 10, 11, 12, 15, 16, 19, 22],
        [0, 1, 4, 7, 10, 12, 15, 16, 19, 22]
      ]
      expect(Part2.create_combos(input)[:data]).to match_array(expected)
    end
  end
end
