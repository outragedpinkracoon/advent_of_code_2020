# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  it 'returns the correct value when the sample is exactly the answer set' do
    input = File.readlines('sample_3.txt')
    expect(Part2.run(input, 127)).to eq([62])
  end

  it 'returns the correct value when it has to iterate one extra time' do
    input = File.readlines('sample_4.txt')
    expect(Part2.run(input, 127)).to eq([62])
  end

  it 'returns the correct value from the sample data' do
    input = File.readlines('sample_5.txt')
    expect(Part2.run(input, 127)).to eq([62])
  end

  it 'returns the correct value from the actual data' do
    input = File.readlines('actual.txt')
    expect(Part2.run(input, 105_950_735)).to eq([13_826_915, 211_901_470])
  end
end
