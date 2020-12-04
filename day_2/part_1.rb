# frozen_string_literal: true

# Advent of code day 2 part 1 https://adventofcode.com/2020/day/2
module Part1
  def self.run(input)
    input.reduce(0) do |acc, item|
      first, second, password = item.split(' ')
      policy_min, policy_max = first.split('-').map(&:to_i)
      policy_letter = second[0]

      valid?(policy_min, policy_max, policy_letter, password) ? acc + 1 : acc
    end
  end

  def self.valid?(min, max, letter, password)
    password.count(letter) >= min &&
      password.count(letter) <= max
  end
end
