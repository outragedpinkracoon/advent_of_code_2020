# frozen_string_literal: true

require 'pry-byebug'

# Advent of code day 6 part 1 https://adventofcode.com/2020/day/6
module Part1
  def self.count_answers(input)
    input.split(/\n\n/).map do |entries|
      entries.delete("\n").split('').uniq.count
    end.sum
  end
end
