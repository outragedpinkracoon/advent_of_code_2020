# frozen_string_literal: true

# Advent of code day 1 part 2 https://adventofcode.com/2020/day/1#part2
module Part2
  def self.run(input)
    input.combination(3).each do |items|
      return items.reduce(&:*) if items.reduce(&:+) == 2020
    end
  end
end
