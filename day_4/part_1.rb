# frozen_string_literal: true

require_relative 'passport_keys_validator'

# Advent of code day 4 part 1 https://adventofcode.com/2020/day/4
module Part1
  def self.run(input)
    input.split(/\n\n/).reduce(0) do |acc, entry|
      fields = entry.split(/[\n\s]+/).map { |i| i.split(':') }.to_h
      acc += 1 if PassportKeysValidator.run(fields)
      acc
    end
  end
end
