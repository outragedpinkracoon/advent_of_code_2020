# frozen_string_literal: true

require 'pry-byebug'
require_relative 'map_generator'
# Advent of code day 10 part 2 https://adventofcode.com/2020/day/10#part2
module Part2Loop
  def self.run(input)
    map = MapGenerator.run(input)
    find_path_count(map)
  end

  def self.find_path_count(map) # rubocop:disable Metrics/MethodLength
    seen = []
    map.each do |_k, v|
      if seen.empty?
        seen = v
        next
      end
      new_seen = []
      seen.each do |key|
        if key == -1
          new_seen << -1
        elsif map[key].empty?
          new_seen << -1
        else
          map[key].each do |k|
            new_seen << k
          end
        end
      end
      seen = new_seen
    end
    seen.size
  end
end
