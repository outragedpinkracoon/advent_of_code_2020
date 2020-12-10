# frozen_string_literal: true

# Advent of code day 5 part 1 and 2 https://adventofcode.com/2020/day/1
module Day5
  def self.part1(input)
    input.map { |entry| seat(entry) }.max
  end

  def self.part2(input)
    items = input.map { |entry| seat(entry) }
    missing_seat(items)
  end

  def self.missing_seat(input)
    items = input.sort
    # get the first item, then drop it from the array
    last_item = items.first
    items.drop(1).each do |item|
      # if the difference is more than 1 return the item - 1, we've found our seat
      return item - 1 if item - last_item > 1

      # otherwise keep searching
      last_item = item
    end
  end

  def self.row(input)
    # the row data is the first 7 digits
    row_data = input[0..6].split('')
    search(data: row_data, min: 0, max: 127, keep_lower_key: 'F')
  end

  def self.column(input)
    # the column data is the last 3 digits
    column_data = input[7..9].split('')
    search(data: column_data, min: 0, max: 7, keep_lower_key: 'L')
  end

  def self.seat(input)
    row = row(input)
    column = column(input)
    row * 8 + column
  end

  def self.search(data:, min:, max:, keep_lower_key:, index: 0)
    # stop searching, we've reached the end of the array and need to return
    # min and max will be the same at this point, so either can be returned
    return min if index == data.size

    # find the max value for the front set of seats
    # e.g 0..127, (127 - 0 / 2) + 0 = 63
    front_max = ((max - min) / 2) + min
    # find the minimum value for the back set of seats by adding one to the
    # maximim seat for the front row
    back_min = front_max + 1
    # we only need to check the symbol for the front seats
    if data[index] == keep_lower_key
      # we want to keep the front seat half
      # keep the min but set the new max to be the maximum front seat
      search(data: data, min: min, max: front_max, index: index + 1, keep_lower_key: keep_lower_key)
    else
      # we want to keep the back seat half
      # keep the max but set the new min to be the minimum back seat
      search(data: data, min: back_min, max: max, index: index + 1, keep_lower_key: keep_lower_key)
    end
  end
end
