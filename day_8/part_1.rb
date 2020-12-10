# frozen_string_literal: true

require 'parser'

# Advent of code day 8 part 1 https://adventofcode.com/2020/day/8
module Part1
  def self.run(input)
    calculate(Parser.run(input))
  end

  def self.calculate(input)
    acc = { value: 0 }
    ran = []
    status = execute_instruction(input, 0, acc, ran)[:status]
    { value: acc[:value], status: status }
  end

  def self.execute_instruction(input, index, acc, ran)
    instruction = input[index]
    return { status: :infinite } if ran.include?(index)
    return { status: :success } if instruction.nil?

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
