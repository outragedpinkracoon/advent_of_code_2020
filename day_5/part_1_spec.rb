# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'
require_relative '../test_helper'

RSpec.describe do
  include TestHelper

  it 'can parse the column' do
    expect(Part1.row('FBFBBFFRLR')).to eq(44)
    expect(Part1.row('BFFFBBFRRR')).to eq(70)
    expect(Part1.row('FFFBBBFRRR')).to eq(14)
    expect(Part1.row('BBFFBBFRLL')).to eq(102)
  end

  it 'can parse the column' do
    expect(Part1.column('FBFBBFFRLR')).to eq(5)
    expect(Part1.column('BFFFBBFRRR')).to eq(7)
    expect(Part1.column('FFFBBBFRRR')).to eq(7)
    expect(Part1.column('BBFFBBFRLL')).to eq(4)
  end

  it 'can get the unique seat id' do
    expect(Part1.seat('FBFBBFFRLR')).to eq(357)
    expect(Part1.seat('BFFFBBFRRR')).to eq(567)
    expect(Part1.seat('FFFBBBFRRR')).to eq(119)
    expect(Part1.seat('BBFFBBFRLL')).to eq(820)
  end

  it 'passes with the day 3 sample data' do
    expect(Part1.run(File.readlines('sample.txt'))).to eq(820)
  end

  it 'passes with the day 3 actual data' do
    expect(Part1.run(File.readlines('actual.txt'))).to eq(955)
  end
end
