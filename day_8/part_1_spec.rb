# frozen_string_literal: true

require 'rspec'
require_relative 'part_1'

RSpec.describe do
  it 'can execute a non jumping instruction set' do
    input = [
      { action: 'nop', value: 0 },
      { action: 'acc', value: 10 },
      { action: 'acc', value: -2 }
    ]
    expect(Day8.calculate(input)).to eq(8)
  end

  it 'can execute a non infinite instruction set' do
    input = [
      { action: 'nop', value: 0 },
      { action: 'acc', value: 10 },
      { action: 'jmp', value: 2 },
      { action: 'nop', value: 0 },
      { action: 'acc', value: -2 },
      { action: 'jmp', value: -3 }
    ]
    expect(Day8.calculate(input)).to eq(8)
  end

  it 'works with the sample instruction set' do
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
    expect(Day8.calculate(input)).to eq(5)
  end

  it 'passes with the sample input' do
    expect(Day8.run(File.readlines('sample.txt'))).to eq(5)
  end

  it 'passes with the actual input' do
    expect(Day8.run(File.readlines('actual.txt'))).to eq(1928)
  end
end
