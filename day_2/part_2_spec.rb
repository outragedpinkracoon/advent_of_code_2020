# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  it 'passes with the day 1 sample input' do
    input = File.readlines('test.txt')
    expect(Part2.run(input)).to eq(1)
  end

  it 'passes with the day 1 actual input' do
    input = File.readlines('input.txt')
    expect(Part2.run(input)).to eq(251)
  end
end
