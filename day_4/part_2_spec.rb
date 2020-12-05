# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  it 'passes with the sample day 4 part 2 test data' do
    input = File.read('part_2_data/sample.txt')
    expect(Part2.run(input)).to eq 4
  end

  it 'passes with the actual day 4 part 2 test data' do
    input = File.read('part_2_data/actual.txt')
    expect(Part2.run(input)).to eq 101
  end
end
