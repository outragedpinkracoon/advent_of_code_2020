# frozen_string_literal: true

require 'pry-byebug'

# Advent of code day 7 part 1 https://adventofcode.com/2020/day/7
module Day7
  def self.run(input)
    count_parents(parse(input))
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
      _, first, second = part.split(' ')
      "#{first}_#{second}".to_sym
    end
  end

  def self.count_parents(bag_data)
    result = []
    # loop over each parent bag
    bag_data.each_key do |current_bag_name|
      child_bags = bag_data[current_bag_name]
      search(bag_data, current_bag_name, result, child_bags)
    end
    # don't double count when a parent back has multiple children
    # that can hold a shiny gold bag
    result.uniq.count
  end

  # loop over the child bags and check if they are a shiny gold bag,
  # if not, recurse on the remaining children and check them
  def self.search(bag_data, key, result, child_bags)
    child_bags.each do |child|
      if child != :shiny_gold
        # check if the children of the child can hold a shiny gold bag
        search(bag_data, key, result, bag_data[child])
      else
        result << key
      end
    end
  end
end
