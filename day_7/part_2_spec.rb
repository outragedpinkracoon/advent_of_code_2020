# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  describe 'part 2' do
    it 'passes with the sample input' do
      expect(Part2.run(File.readlines('sample.txt'))).to eq(32)
    end

    it 'passes with the second sample input' do
      expect(Part2.run(File.readlines('sample2.txt'))).to eq(126)
    end

    it 'passes with the actual input' do
      expect(Part2.run(File.readlines('actual.txt'))).to eq(80_902)
    end
  end
end
