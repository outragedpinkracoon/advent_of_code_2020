# frozen_string_literal: true

require 'rspec'
require_relative 'map_generator'

RSpec.describe do
  describe 'run' do
    it 'works on the first sample input' do
      expected = {
        0 => [1, 2],
        1 => [2],
        2 => [5],
        5 => []
      }
      expect(MapGenerator.run(File.readlines('sample_3.txt'))).to eq(expected)
    end

    it 'works on the second sample input' do
      expected = {
        0 => [1, 2, 3],
        1 => [2, 3],
        2 => [3],
        3 => [6],
        6 => []
      }
      expect(MapGenerator.run(File.readlines('sample_4.txt'))).to eq(expected)
    end

    it 'works on the sample input from the puzzle' do
      expected = {
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
      expect(MapGenerator.run(File.readlines('sample_1.txt'))).to eq(expected)
    end
  end
end
