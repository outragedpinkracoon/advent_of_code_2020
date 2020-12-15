# frozen_string_literal: true

# Advent of code day 9 part 1 https://adventofcode.com/2020/day/8
module Part1
  def self.run(input, preamble_size)
    sequence = input.map(&:to_i)
    preamble = sequence[0...preamble_size]
    naughty = nil

    sequence.drop(preamble_size).each do |item|
      if check(item, preamble).nil?
        naughty = item
        break
      end
      preamble = preamble.drop(1) << item
    end
    naughty
  end

  def self.check(to_check, preamble)
    preamble.combination(2).to_a.find do |first, second|
      first + second == to_check
    end
  end
end
