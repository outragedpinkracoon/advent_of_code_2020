# frozen_string_literal: true

# Advent of code day 7 part 1 & 2 https://adventofcode.com/2020/day/7
module Parser
  def self.run(input, result = {})
    input.each do |line|
      parse_line(line, result)
    end
    result
  end

  # Takes one line of input:
  # "light red bags contain 1 bright white bag, 2 muted yellow bags."
  # returns a hash with it's parent and children keys added
  # { light_red: [:bright_white, :muted_yellow] }
  def self.parse_line(input, result)
    parts = input.split('contain').map(&:strip)

    containing_bag = parts[0].gsub(' bags', '').gsub(' ', '_').to_sym
    no_child_bags = parts[1].include?('no other bags')

    if no_child_bags
      result[containing_bag] = []
      return result
    end

    result[containing_bag] = child_bags(parts)
    result
  end

  # Takes in the child info parts e.g ["1 bright white bag", "2 muted yellow bags."]
  # returns the names as a list of symbols # [:bright_white, :muted_yellow]
  def self.child_bags(parts)
    child_bag_parts = parts[1].split(',').map(&:strip)
    child_bag_parts.map do |part|
      count, first, second = part.split(' ')
      { name: "#{first}_#{second}".to_sym, num: count.to_i }
    end
  end
end
