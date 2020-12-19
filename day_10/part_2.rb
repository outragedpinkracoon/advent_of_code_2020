# frozen_string_literal: true

require 'pry-byebug'
require_relative 'map_generator'
# Advent of code day 10 part 2 https://adventofcode.com/2020/day/10#part2
# This takes a LONG time to run on the actual input and eats ALL the memory
# by building up the lists to return. Never run on the actual input.
module Part2
  def self.run(input)
    map = MapGenerator.run(input)
    create_combos(map)[:count]
  end

  # Find all the possible paths through the data set. Takes in a hash of
  # all numbers from the input as keys, with the numbers of each of the children
  # as the values e.g { 0 => [1,3], 1 => [3], 3 => []}
  def self.create_combos(input)
    children = input[0]
    result = { data: [], count: 0 }
    children.each do |k|
      set = [0, k]
      generate(set, k, input, result)
    end
    result
  end

  # Build up the list of the current combination, when you get to a
  # key with no children, return the list.
  def self.generate(current, key, input, result) # rubocop:disable Metrics/MethodLength
    children = input[key]
    if children.empty?
      result[:data] << current
      result[:count] += 1
      return
    end
    index = 0
    copies = children.size
    # we need to make a new array for each child, so we capture that as a
    # new path through the data.
    copies.times do |_n|
      copy = current.clone
      child = children[index]
      copy << child
      generate(copy, child, input, result)
      index += 1
    end
  end
end
