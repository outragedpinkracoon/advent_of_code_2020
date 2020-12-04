# frozen_string_literal: true

# Advent of code day 2 part 2 https://adventofcode.com/2020/day/2#part2
module Part2
  def self.run(input)
    input.reduce(0) do |acc, item|
      first, second, password = item.split(' ')
      policy_position1, policy_position2 = first.split('-').map { |i| i.to_i - 1 }
      policy_letter = second[0]

      valid?(policy_position1, policy_position2, policy_letter, password) ? acc + 1 : acc
    end
  end

  def self.valid?(position1, position2, letter, password)
    is_first = password[position1] == letter
    is_second = password[position2] == letter

    (is_first && !is_second) || (is_second && !is_first)
  end
end
