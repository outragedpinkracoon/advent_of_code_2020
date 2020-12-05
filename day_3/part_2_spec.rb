# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  it 'passes with the day 3 sample data slope 2' do
    input = File.readlines('test_3.txt')
    expect(Part2.run_slope(input, 3)[:values]).to eq([0, 1, 0, 1, 1, 0, 1, 1, 1, 1])
    expect(Part2.run_slope(input, 3)[:count]).to eq(7)
  end

  it 'passes with the day 3 sample data slope 1' do
    input = File.readlines('test_3.txt')
    expect(Part2.run_slope(input, 1)[:count]).to eq(2)
  end

  it 'passes with the day 3 sample data slope 3' do
    input = File.readlines('test_3.txt')
    expect(Part2.run_slope(input, 5)[:count]).to eq(3)
  end

  it 'passes with the day 3 sample data slope 4' do
    input = File.readlines('test_3.txt')
    expect(Part2.run_slope(input, 7)[:count]).to eq(4)
  end

  it 'passes with the day 3 sample data slope 5' do
    input = File.readlines('test_3.txt')
    expect(Part2.run_slope(input, 1, skip: true)[:count]).to eq(2)
    expect(Part2.run_slope(input, 1, skip: true)[:values]).to eq([1, 0, 1, 0, 0])
  end

  it 'passes with the day 3 sample data' do
    input = File.readlines('test_3.txt')
    slopes = [{ move: 1 }, { move: 3 }, { move: 5 }, { move: 7 }, { move: 1, skip: true }]
    expect(Part2.run(slopes, input)).to eq(336)
  end

  it 'passes with the day 4 actual data' do
    input = File.readlines('test_4.txt')
    slopes = [{ move: 1 }, { move: 3 }, { move: 5 }, { move: 7 }, { move: 1, skip: true }]
    expect(Part2.run(slopes, input)).to eq(3_492_520_200)
  end
end
