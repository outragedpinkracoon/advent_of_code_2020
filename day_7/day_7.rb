# frozen_string_literal: true

require 'pry-byebug'

# Advent of code day 7 part 1 https://adventofcode.com/2020/day/7
module Day7
  def self.parse(input, result)
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
    # ["light red bags", "1 bright white bag, 2 muted yellow bags."]
    parts = input.split('contain').map(&:strip)
    # :light_red
    containing_bag = parts[0].gsub(' bags', '').gsub(' ', '_').to_sym
    no_child_bags = parts[1].include?('no other bags')

    if no_child_bags
      result[containing_bag] = []
      return result
    end

    result[containing_bag] = child_bags(parts)
    result
  end

  def self.child_bags(parts)
    # ["1 bright white bag", "2 muted yellow bags."]
    child_bag_parts = parts[1].split(',').map(&:strip)
    # [:bright_white, :muted_yellow]
    child_bag_parts.map do |part|
      _, first, second = part.split(' ')
      "#{first}_#{second}".to_sym
    end
  end

  def self.count_parents(input)
    search(input.keys, input)
  end

  def self.search(keys, input, result = 0)
    return result if keys.empty?

    current_bag_children = input[keys.first]
    result += 1 if current_bag_children.include?(:shiny_gold)
    search(keys.drop(1), input, result)
  end
end
