# frozen_string_literal: true

# Advent of code day 4 part 1 https://adventofcode.com/2020/day/4
module Part1
  def self.run(input)
    input.split(/\n\n/).reduce(0) do |acc, entry|
      acc += 1 if valid?(entry)
      acc
    end
  end

  def self.valid?(entry)
    # ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm
    fields = entry.split(/[\n\s]+/).map { |i| i.split(':') }.to_h
    keys = fields.keys.to_set

    minimium_keys?(keys) && valid_keys?(keys)
  end

  def self.minimium_keys?(keys)
    keys.size >= 7
  end

  def self.valid_keys?(keys)
    passport?(keys) || north_pole_credentials?(keys)
  end

  def self.passport?(keys)
    required_keys = %w[ecl pid eyr hcl byr iyr cid hgt].to_set
    keys == required_keys
  end

  def self.north_pole_credentials?(keys)
    required_keys = %w[ecl pid eyr hcl byr iyr hgt].to_set
    keys == required_keys
  end
end
