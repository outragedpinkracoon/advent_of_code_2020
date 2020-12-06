# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  it 'passes with no repeating data needed in the file' do
    input = File.readlines('test_1.txt')
    expect(Part1.run(input)[:values]).to eq([0, 1, 0])
    expect(Part1.run(input)[:count]).to eq(1)
  end

  it 'passes with 1 line of repeating data in the file' do
    input = File.readlines('test_2.txt')
    expect(Part1.run(input)[:values]).to eq([0, 1, 0, 1])
    expect(Part1.run(input)[:count]).to eq(2)
  end

  it 'passes with the day 3 sample data' do
    input = File.readlines('sample.txt')
    expect(Part1.run(input)[:values]).to eq([0, 1, 0, 1, 1, 0, 1, 1, 1, 1])
    expect(Part1.run(input)[:count]).to eq(7)
  end

  it 'passes with the day 3 actual data' do
    input = File.readlines('actual.txt')
    expect(Part1.run(input)[:count]).to eq(178)
  end
end
