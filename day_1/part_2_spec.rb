# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'
require_relative '../test_helper'

RSpec.describe do
  include TestHelper

  it 'works with three numbers' do
    input = [979, 366, 675]
    expect(Part2.run(input)).to eq(241_861_950)
  end

  it 'works with the day 1 sample input' do
    input = read_file_as_ints('test.txt')
    expect(Part2.run(input)).to eq(241_861_950)
  end

  it 'works with the day 1 actual input' do
    input = read_file_as_ints('input.txt')
    expect(Part2.run(input)).to eq(49_880_012)
  end
end
