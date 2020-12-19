# frozen_string_literal: true

require 'pry-byebug'
require_relative 'map_generator'
# Advent of code day 10 part 2 https://adventofcode.com/2020/day/10#part2
module Part2Loop
  def self.run(input)
    map = MapGenerator.run(input)
    find_path_count(map)[-1]
  end

  # Takes in a map of nodes and their children, where all paths lead to the largest value and start
  # at the smallest value in the hash and outputs a hash that should only ever contain the key -1,
  # with the value that equals the count of the paths through the hash
  def self.find_path_count(map) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
    seen = Hash.new(0)
    map.each do |_k, v|
      # it's the first time, throw the children into the hash with
      # a count of 1 e.g. { 1 => 1, 2 => 1 }
      if seen.empty?
        seen = v.map { |i| [i, 1] }.to_h
        next
      end
      # we want to entirely replace the old result with the new counts
      # of the children we have to check next
      new_seen = Hash.new(0)
      # for every key we have to check that we've seen
      seen.each do |key, count|
        # find the values of the children of a node
        children = map[key]
        # if it's not in the map, or it's empty we've reached the end of a path
        # assign it to the magic -1 key
        if children.nil? || children.empty?
          new_seen[-1] += 1 * count
        # otherwise replace the old 'seen' hash with the children we
        # need to check next and the number of times we need to check them
        # e.g. { 2 => 4, 3 => 2 }
        else
          children.each do |c|
            new_seen[c] += 1 * count
          end
        end
      end
      seen = new_seen
    end
    seen
  end
end
