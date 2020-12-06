# frozen_string_literal: true

# Advent of code day 1 part 1 https://adventofcode.com/2020/day/1
module Part1
  def self.run(collection)
    collection.each_with_index do |item, index|
      # get the array with the item we are looking for removed
      rest = clone_and_delete_at(collection, index)
      # search for the item that adds to our saved value to 2020
      # from the rest of the array
      found, result = search(item, rest).values_at(:found, :value)
      # exit the search if we have found it, otherwise continue
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
