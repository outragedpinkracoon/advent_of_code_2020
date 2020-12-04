# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  it 'passes with the day 1 sample input' do
    input = File.readlines('test.txt')
    expect(Part1.run(input)).to eq(2)
  end

  it 'passes with the day 1 actual input' do
    input = File.readlines('input.txt')
    expect(Part1.run(input)).to eq(460)
  end
end
