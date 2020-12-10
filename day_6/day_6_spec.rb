# frozen_string_literal: true

require 'rspec'
require_relative 'day_6'

RSpec.describe do
  it 'passes with one group' do
    expect(Day6.part1(File.read('test_1.txt'))).to eq(6)
  end

  it 'passes with day 6 sample data' do
    expect(Day6.part1(File.read('sample.txt'))).to eq(11)
  end

  it 'passes with day 6 actual data' do
    expect(Day6.part1(File.read('actual.txt'))).to eq(6532)
  end

  it 'passes with one group' do
    expect(Day6.part2(File.read('test_1.txt'))).to eq(3)
  end

  it 'passes with day 6 sample data' do
    expect(Day6.part2(File.read('sample.txt'))).to eq(6)
  end

  it 'passes with day 6 actual data' do
    expect(Day6.part2(File.read('actual.txt'))).to eq(3427)
  end
end
