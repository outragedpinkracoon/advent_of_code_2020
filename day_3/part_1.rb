# frozen_string_literal: true

# Advent of code day 3 part 1 https://adventofcode.com/2020/day/3
module Part1
  def self.run(input)
    # we always move horizontally by 3
    x_position = 3
    input.drop(1).each_with_object({ values: [], count: 0 }) do |row, obj|
      # we need to account for indicies that are beyond the maximum size of
      # the repeating pattern grid. Mod our current position by the size
      # of the repeating pattern to get the index as if it is a valid position
      # on the grid
      index = x_position % (row.size - 1)
      hit_tree = row[index] == '#'
      obj[:values] << (hit_tree ? 1 : 0)
      obj[:count] += 1 if hit_tree
      x_position += 3
    end
  end
end
