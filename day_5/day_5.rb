# frozen_string_literal: true

require 'pry-byebug'

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
    last_item = items.first
    items.drop(1).each do |item|
      return item - 1 if item - last_item > 1

      last_item = item
    end
  end

  def self.row(input)
    row_data = input[0..6].split('')
    search(data: row_data, min: 0, max: 127, keep_lower_key: 'F')
  end

  def self.column(input)
    column_data = input[7..9].split('')
    search(data: column_data, min: 0, max: 7, keep_lower_key: 'L')
  end

  def self.seat(input)
    row = row(input)
    column = column(input)
    row * 8 + column
  end

  def self.search(data:, min:, max:, keep_lower_key:, index: 0)
    return min if index == data.size

    front_max = ((max - min) / 2) + min
    back_min = front_max + 1
    if data[index] == keep_lower_key
      search(data: data, min: min, max: front_max, index: index + 1, keep_lower_key: keep_lower_key)
    else
      search(data: data, min: back_min, max: max, index: index + 1, keep_lower_key: keep_lower)
    end
  end
end
