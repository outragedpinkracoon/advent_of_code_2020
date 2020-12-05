# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  it 'is a valid passport with all 8 fields' do
    input = File.read('part_1_data/test_1.txt')
    expect(Part1.run(input)).to eq 1
  end

  it 'is invalid when there are less than 7 properties' do
    input = 'byr:1937 iyr:2017 cid:147 hgt:183cm'
    expect(Part1.run(input)).to eq 0
  end

  it 'is an invalid passport missing hgt' do
    input = File.read('part_1_data/test_2.txt')
    expect(Part1.run(input)).to eq 0
  end

  it 'is a North Pole credentials doc missing cid' do
    input = File.read('part_1_data/test_3.txt')
    expect(Part1.run(input)).to eq 1
  end

  it 'is an invalid passport with a missing field and missing cid' do
    input = File.read('part_1_data/test_4.txt')
    expect(Part1.run(input)).to be 0
  end

  it 'passes with the sample test data' do
    input = File.read('part_1_data/sample.txt')
    expect(Part1.run(input)).to eq 2
  end

  it 'passes with the actual test data' do
    input = File.read('part_1_data/actual.txt')
    expect(Part1.run(input)).to eq 192
  end
end
