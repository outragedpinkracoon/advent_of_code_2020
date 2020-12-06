# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'
require_relative '../test_helper'

RSpec.describe do
  include TestHelper

  it 'passes with one group' do
    expect(Part1.count_answers(File.read('test_1.txt'))).to eq(6)
  end

  it 'passes with day 6 sample data' do
    expect(Part1.count_answers(File.read('sample.txt'))).to eq(11)
  end

  it 'passes with day 6 actual data' do
    expect(Part1.count_answers(File.read('actual.txt'))).to eq(6532)
  end
end
