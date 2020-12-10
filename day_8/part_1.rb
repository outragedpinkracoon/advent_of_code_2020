# frozen_string_literal: true

require 'parser'

# Advent of code day 8 part 1 https://adventofcode.com/2020/day/7
module Day8
  def self.run(input)
    calculate(Parser.run(input))
  end

  def self.calculate(input)
    acc = { value: 0 }
    ran = []
    execute_instruction(input, 0, acc, ran)
    acc[:value]
  end

  def self.execute_instruction(input, index, acc, ran)
    instruction = input[index]
    return if ran.include?(index) || instruction.nil?

    ran << index

    next_index = update_index(index, instruction)
    update_acc(acc, instruction)
    execute_instruction(input, next_index, acc, ran)
  end

  def self.update_index(index, instruction)
    return index + instruction[:value] if instruction[:action] == 'jmp'

    index + 1
  end

  def self.update_acc(acc, instruction)
    acc[:value] += instruction[:value] if instruction[:action] == 'acc'
  end
end
