# frozen_string_literal: true

require 'pry-byebug'

# Advent of code day 6 part 1 and 2 https://adventofcode.com/2020/day/6
module Day6
  def self.part1(input)
    input.split(/\n\n/).map do |entries|
      # make the answers into one big string, then get the unique count of letters
      entries.delete("\n").split('').uniq.count
    end.sum
  end

  def self.part2(input)
    # get the answers for a group
    input.split(/\n\n/).map do |group_answers|
      # get the count of people in the group
      participant_count = group_answers.split(/\n/).count
      # make a hash of the letter counts e.g { "a" => 3, "b" => 4}
      counts = letter_counts(group_answers)
      # return only questions that have an answer count that is the same as
      # the number of people in the group
      questions_answered_by_all(counts, participant_count).keys.count
    end.sum
  end

  def self.questions_answered_by_all(letter_counts, participant_count)
    letter_counts.select do |_, times_answered|
      times_answered == participant_count
    end
  end

  def self.letter_counts(answers)
    # get the list of all the answers for a group
    all_answers = answers.delete("\n").split('')
    # build a hash of letter counts e.g.
    all_answers.each_with_object({}) do |item, obj|
      obj[item] = obj[item] ? obj[item] + 1 : 1
    end
  end
end
