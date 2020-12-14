# frozen_string_literal: true

require 'parser'

# Advent of code day 8 part 2 https://adventofcode.com/2020/day/8#part2
module Part2
  def self.run(input)
    search(Parser.run(input))
  end

  # Find all the 'nop' or 'jmp' instructions and swap them around
  # First run jmp and if we don't find the faulty instruction try
  # the nops
  def self.search(input)
    naughty = find('nop', input, 'jmp')
    return naughty if naughty

    find('jmp', input, 'nop')
  end

  def self.find(to_match, input, sub)
    matches(input, to_match).each do |index|
      # copy the input so we don't mutate it
      clone = input.clone
      value = input[index][:value]
      clone[index] = { action: sub, value: value }
      status, value = Part1.calculate(clone).values_at(:status, :value)
      return value if status == :success
    end
    nil
  end

  def self.matches(input, to_match)
    input.each.with_index.map do |item, index|
      index if item[:action] == to_match
    end.compact
  end
end
