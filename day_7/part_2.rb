# frozen_string_literal: true

require 'parser'

# Advent of code day 7 part 2 https://adventofcode.com/2020/day/7#part2
module Part2
  def self.run(input)
    count_total_bags(Parser.run(input))
  end

  def self.parse(input, result = {})
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

  # get the children of the shiny gold bag, the loop over them passing
  # on their multiplier to subsequent child bags
  def self.count_total_bags(bag_data)
    result = { count: 0 }
    search_total(bag_data, result, bag_data[:shiny_gold])
    result[:count]
  end

  def self.search_total(bag_data, result, child_bags, multiplier = 1)
    child_bags.each do |child|
      result[:count] += child[:num] * multiplier
      search_total(bag_data, result, bag_data[child[:name]], child[:num] * multiplier)
    end
  end
end
