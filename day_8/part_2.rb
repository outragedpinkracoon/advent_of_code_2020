# frozen_string_literal: true

require 'parser'

# Advent of code day 8 part 2 https://adventofcode.com/2020/day/8#part2
module Part2
  def self.run(input)
    search(Parser.run(input))
  end

  # TODO reuse some of this logic rather than repeating it lol so gross
  def self.search(input)
    all_nops = input.each.with_index.map do |item, index|
      index if item[:action] == 'nop'
    end.compact

    naughty = nil
    all_nops.each do |index|
      clone = input.clone
      value = input[index][:value]
      clone[index] = { action: 'jmp', value: value }
      status, value = Part1.calculate(clone).values_at(:status, :value)
      if status == :success
        naughty = value
        break
      end
    end
    return naughty if naughty

    all_jmps = input.each.with_index.map do |item, index|
      index if item[:action] == 'jmp'
    end.compact

    all_jmps.each do |index|
      clone = input.clone
      value = input[index][:value]
      clone[index] = { action: 'nop', value: value }
      status, value = Part1.calculate(clone).values_at(:status, :value)
      if status == :success
        naughty = value
        break
      end
    end

    naughty
  end
end
