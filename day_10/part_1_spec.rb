# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  xit 'returns the correct answer for the first sample input' do
    input = File.readlines('sample_1.txt')
    expect(Part1.run(input)).to eq(35)
  end

  xit 'returns the correct answer for the second sample input' do
    input = File.readlines('sample_2.txt')
    expect(Part1.run(input)).to eq(220)
  end

  xit 'returns the correct answer for the actual sample input' do
    input = File.readlines('actual.txt')
    expect(Part1.run(input)).to eq(2376)
  end
end
