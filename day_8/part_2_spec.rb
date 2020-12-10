# frozen_string_literal: true

require 'rspec'
require_relative 'part_2'

RSpec.describe do
  it 'finds the naughty input' do
    input = [
      { action: 'nop', value: 0 },
      { action: 'acc', value: 1 },
      { action: 'jmp', value: 4 },
      { action: 'acc', value: 3 },
      { action: 'jmp', value: -3 },
      { action: 'acc', value: -99 },
      { action: 'acc', value: 1 },
      { action: 'jmp', value: -4 },
      { action: 'acc', value: 6 }
    ]
    expect(Part2.search(input)).to be(8)
  end

  it 'passes on the sample input' do
    expect(Part2.run(File.readlines('sample.txt'))).to be(8)
  end

  it 'passes on the actual input' do
    expect(Part2.run(File.readlines('actual.txt'))).to be(1319)
  end
end
