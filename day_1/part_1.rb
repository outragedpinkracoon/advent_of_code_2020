# frozen_string_literal: true

# Advent of code day 1 part 1 https://adventofcode.com/2020/day/1
module Part1
  def self.run(collection)
    collection.each_with_index do |item, index|
      rest = clone_and_delete_at(collection, index)
      found, result = search(item, rest).values_at(:found, :value)
      return result if found
    end
  end

  def self.clone_and_delete_at(collection, index)
    rest = collection.clone
    rest.delete_at(index)
    rest
  end

  def self.search(item_to_check, collection)
    collection.each_with_object({ found: false, value: [] }) do |item, obj|
      if item_to_check + item == 2020
        obj[:found] = true
        obj[:value] = item_to_check * item
      end
    end
  end
end
