# frozen_string_literal: true

require 'pry-byebug'

# Advent of code day 8 part 1 & 2 https://adventofcode.com/2020/day/7
module Parser
  def self.run(input)
    input.reduce([]) do |res, line|
      action, value = line.split(' ')
      res << { action: action, value: value.to_i }
    end
  end
end
