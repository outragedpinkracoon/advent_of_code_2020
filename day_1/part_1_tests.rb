# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  it 'works with two numbers' do
    input = [1721, 299]
    expect(Part1.run(input)).to eq(514_579)
  end

  it 'works with three numbers' do
    input = [1721, 299, 366]
    expect(Part1.run(input)).to eq(514_579)
  end

  it 'works when the match is not the first number' do
    input = [366, 299, 1721]
    expect(Part1.run(input)).to eq(514_579)
  end

  it 'works with the day 1 sample input' do
    input = Part1.read_file('test.txt')
    expect(Part1.run(input)).to eq(514_579)
  end

  it 'works with the day 1 sample input' do
    input = Part1.read_file('input.txt')
    expect(Part1.run(input)).to eq(935_419)
  end
end
