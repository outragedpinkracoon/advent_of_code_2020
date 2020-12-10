# frozen_string_literal: true

require 'rspec'
require_relative 'day_5'

RSpec.describe do
  it 'can parse the column' do
    expect(Day5.row('FBFBBFFRLR')).to eq(44)
    expect(Day5.row('BFFFBBFRRR')).to eq(70)
    expect(Day5.row('FFFBBBFRRR')).to eq(14)
    expect(Day5.row('BBFFBBFRLL')).to eq(102)
  end

  it 'can parse the column' do
    expect(Day5.column('FBFBBFFRLR')).to eq(5)
    expect(Day5.column('BFFFBBFRRR')).to eq(7)
    expect(Day5.column('FFFBBBFRRR')).to eq(7)
    expect(Day5.column('BBFFBBFRLL')).to eq(4)
  end

  it 'can get the unique seat id' do
    expect(Day5.seat('FBFBBFFRLR')).to eq(357)
    expect(Day5.seat('BFFFBBFRRR')).to eq(567)
    expect(Day5.seat('FFFBBBFRRR')).to eq(119)
    expect(Day5.seat('BBFFBBFRLL')).to eq(820)
  end

  it 'passes with the day 3 sample data' do
    expect(Day5.part1(File.readlines('sample.txt'))).to eq(820)
  end

  it 'passes with the day 3 actual data' do
    expect(Day5.part1(File.readlines('actual.txt'))).to eq(955)
  end

  it 'can find the missing seat from the test data' do
    expect(Day5.missing_seat([1, 5, 2, 3])).to eq(4)
  end

  it 'finds the missing seat number' do
    expect(Day5.part2(File.readlines('actual.txt'))).to eq(569)
  end
end
