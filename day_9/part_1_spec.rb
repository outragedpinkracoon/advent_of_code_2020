# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  it 'returns nil when all numbers in the sample are valid' do
    input = File.readlines('sample_1.txt')
    expect(Part1.run(input, 5)).to eq(nil)
  end

  it 'returns the first number that is not valid' do
    input = File.readlines('sample_2.txt')
    expect(Part1.run(input, 5)).to eq(127)
  end

  it 'returns the correct invalid number in the actual data' do
    input = File.readlines('actual.txt')
    expect(Part1.run(input, 25)).to eq(105_950_735)
  end
end
