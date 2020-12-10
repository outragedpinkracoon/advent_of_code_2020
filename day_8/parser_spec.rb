# frozen_string_literal: true

require 'rspec'
require_relative 'parser'

RSpec.describe do
  it 'parses the sample input' do
    expected = [
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
    expect(Parser.run(File.readlines('sample.txt'))).to eq(expected)
  end
end
