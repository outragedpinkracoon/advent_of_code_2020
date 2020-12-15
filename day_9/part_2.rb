# frozen_string_literal: true

require 'pry-byebug'

# Advent of code day 9 part 2 https://adventofcode.com/2020/day/9#part2
module Part2
  def self.run(input, number_to_check)
    sequence = input.map(&:to_i)
    search_sequence(sequence, number_to_check).map { |i| i[:total] }.uniq.sort
  end

  # My data is disgusting and has multiple contiguous sequences in it!
  def self.search_sequence(sequence, number_to_check, found = []) # rubocop:disable Metrics/MethodLength
    return found if sequence.empty?

    current_search = []
    sequence.each do |item|
      # stuff the current number we are on into the list we are currently adding
      # to see if it sums to the number to check
      current_search << item
      # exit if we've exceeded the number itself and if the current
      # sum doesn't equal the number, skip to the next iteration
      break if current_search.sum > number_to_check
      next if current_search.sum != number_to_check

      # we've found the sequence that adds to the total, add the result to the
      # array of possible answers
      min = current_search.min
      max = current_search.max
      result = { min: min, max: max, total: min + max, set: current_search }
      found << result
      break
    end
    # search again, but drop the first item from the sequence to generate new possible
    # sequence combinations from that start point
    search_sequence(sequence.drop(1), number_to_check, found)
  end
end
