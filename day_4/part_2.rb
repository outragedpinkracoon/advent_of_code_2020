# frozen_string_literal: true

require_relative 'passport_keys_validator'
require_relative 'passport_values_validator'

# Advent of code day 4 part 2 https://adventofcode.com/2020/day/4#part2
module Part2
  def self.run(input)
    input.split(/\n\n/).reduce(0) do |acc, entry|
      fields = entry.split(/[\n\s]+/).map { |i| i.split(':') }.to_h
      acc += 1 if valid_passport?(fields)
      acc
    end
  end

  def self.valid_passport?(fields)
    PassportKeysValidator.run(fields) && PassportValuesValidator.run(fields)
  end
end
