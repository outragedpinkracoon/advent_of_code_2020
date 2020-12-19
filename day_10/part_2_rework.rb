# frozen_string_literal: true

require 'pry-byebug'
require_relative 'map_generator'
# Advent of code day 10 part 2 https://adventofcode.com/2020/day/10#part2
# This takes a LONG time to run on the sample actual input and eats ALL the memory
# by building up the lists to return. Never run on the actual input.
module Part2Rework
  def self.run(input)
    map = MapGenerator.run(input)
    create_counts(map)[:count]
  end

  # Find all the possible paths through the data set. Takes in a hash of
  # all numbers from the input as keys, with the numbers of each of the children
  # as the values e.g { 0 => [1,3], 1 => [3], 3 => []}
  def self.create_counts(input)
    children = input[0]
    result = { count: 0 }
    children.each do |k|
      generate(k, input, result)
    end
    result
  end

  # Build up the list of the current combination, when you get to a
  # key with no children, return the list.
  def self.generate(key, input, result)  # rubocop:disable Metrics/MethodLength
    children = input[key]
    if children.empty?
      result[:count] += 1
      return
    end
    index = 0
    # for every path, run generate again so we can traverse deeper
    children.size.times do |_n|
      child = children[index]
      generate(child, input, result)
      index += 1
    end
  end
end
