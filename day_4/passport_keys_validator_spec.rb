# frozen_string_literal: true

require 'rspec'
require_relative 'passport_keys_validator'

RSpec.describe do
  it 'is a valid passport with all 8 fields' do
    input = {
      'ecl' => 'gry',
      'pid' => '860033327', 'eyr' => '2020', 'hcl' => '#fffffd',
      'byr' => '1937', 'iyr' => '2017', 'cid' => '147',
      'hgt' => '183cm'
    }
    expect(PassportKeysValidator.run(input)).to be true
  end

  it 'is invalid when there are less than 7 properties' do
    input = {
      'byr' => '1937',
      'iyr' => '2017',
      'cid' => '147',
      'hgt' => '183cm'
    }
    expect(PassportKeysValidator.run(input)).to be false
  end

  it 'is an invalid passport missing hgt' do
    input = {
      'iyr' => '2013',
      'ecl' => 'amb',
      'cid' => '350',
      'eyr' => '2023',
      'pid' => '028048884',
      'hcl' => '#cfa07d',
      'byr' => '1929'
    }
    expect(PassportKeysValidator.run(input)).to be false
  end

  it 'is a North Pole credentials doc missing cid' do
    input = {
      'hcl' => '#ae17e1',
      'iyr' => '2013',
      'eyr' => '2024',
      'ecl' => 'brn',
      'pid' => '760753108',
      'byr' => '1931',
      'hgt' => '179cm'
    }
    expect(PassportKeysValidator.run(input)).to be true
  end

  it 'is an invalid passport with a missing field and missing cid' do
    input = {
      'hcl' => '#cfa07d',
      'eyr' => '2025',
      'pid' => '166559648',
      'iyr' => '2011',
      'ecl' => 'brn',
      'hgt' => '59in'
    }
    expect(PassportKeysValidator.run(input)).to be false
  end
end
