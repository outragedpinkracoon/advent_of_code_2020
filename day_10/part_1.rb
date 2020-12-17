# frozen_string_literal: true

# Advent of code day 10 part 1 https://adventofcode.com/2020/day/10
module Part1
  def self.run(input)
    adapters = input.map(&:to_i).sort.unshift(0)
    result = adapters.each_with_index.with_object({ 1 => 0, 3 => 0 }) do |(adapter, i), obj|
      next_adapter = adapters[i + 1]
      index = next_adapter ? next_adapter - adapter : 3
      obj[index] += 1
    end
    result[1] * result[3]
  end
end
