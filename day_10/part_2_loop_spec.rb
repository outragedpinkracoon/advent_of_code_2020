# frozen_string_literal: true

require 'rspec'
require_relative 'part_2_loop'

RSpec.describe do
  describe 'run' do
    it 'works on the first sample input' do
      expect(Part2Loop.run(File.readlines('sample_3.txt'))).to eq(2)
    end

    it 'works on the second sample input' do
      expect(Part2Loop.run(File.readlines('sample_4.txt'))).to eq(4)
    end

    it 'works on the sample input from the puzzle' do
      expect(Part2Loop.run(File.readlines('sample_1.txt'))).to eq(8)
    end

    it 'works on the larger sample input from the puzzle' do
      expect(Part2Loop.run(File.readlines('sample_5.txt'))).to eq(19_208)
    end

    xit 'works on the actual sample input from the puzzle' do
      expect(Part2Loop.run(File.readlines('actual.txt'))).to eq(19_208)
    end
  end
end
