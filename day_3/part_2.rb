# frozen_string_literal: true

# Advent of code day 3 part 1 https://adventofcode.com/2020/day/3#part2
module Part2
  def self.run(slopes, input)
    output = slopes.map do |slope|
      skip = slope[:skip] || false
      run_slope(input, slope[:move], skip: skip)
    end
    output.map { |i| i[:count] }.reduce(:*)
  end

  def self.run_slope(input, movement, skip: false)
    x_position = movement
    valid_rows = skip ? input.reject { |v| input.index(v).odd? }.drop(1) : input.drop(1)
    valid_rows.each_with_object({ values: [], count: 0 }) do |row, obj|
      index = x_position % (row.size - 1)
      hit_tree = row[index] == '#'
      obj[:values] << (hit_tree ? 1 : 0)
      obj[:count] += 1 if hit_tree
      x_position += movement
    end
  end
end
