# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  it 'returns the correct answer for the first sample input' do
    input = File.readlines('sample_3.txt')
    expected = { combos: [[1245],[125],[145]], total: 3 }
    expect(Part2.run(input)).to eq(expected)
  end
end

#1245
