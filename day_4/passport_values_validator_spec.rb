# frozen_string_literal: true

require 'rspec'
require 'rspec-parameterized'
require_relative 'passport_values_validator'

RSpec.describe PassportValuesValidator do
  describe 'run' do
    where(:value, :result) do
      [
        [
          { 'byr' => '2002',
            'iyr' => '2015',
            'eyr' => '2025',
            'hgt' => '155cm',
            'hcl' => '#123abc',
            'pid' => '123456789',
            'ecl' => 'amb' },
          true
        ], # all valid
        [
          {
            'byr' => '1919',
            'iyr' => '2009',
            'eyr' => '2018',
            'hgt' => '200cm',
            'hcl' => '123abc',
            'ecl' => 'zzz',
            'pid' => '1'
          },
          false
        ], # all invalid
        [
          {
            'byr' => '2002',
            'iyr' => '2009',
            'eyr' => '2018',
            'hgt' => '60in',
            'hcl' => '#123abc',
            'ecl' => 'gry',
            'pid' => '123456789'
          },
          false
        ] # invalid byr
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.run(value)).to be result
      end
    end
  end

  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  describe 'byr' do
    where(:value, :result) do
      [
        ['2', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['2003', false],
        ['1919', false],
        ['2002', true],
        ['1920', true],
        ['1980', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_byr?(value)).to be result
      end
    end
  end

  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  describe 'iyr' do
    where(:value, :result) do
      [
        ['2', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['2021', false],
        ['2009', false],
        ['2010', true],
        ['2020', true],
        ['2015', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_iyr?(value)).to be result
      end
    end
  end

  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  describe 'eyr' do
    where(:value, :result) do
      [
        ['2', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['2019', false],
        ['2031', false],
        ['2020', true],
        ['2030', true],
        ['2025', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_eyr?(value)).to be result
      end
    end
  end

  # hgt (Height) - a number followed by either cm or in:
  # If cm, the number must be at least 150 and at most 193.
  # If in, the number must be at least 59 and at most 76.
  describe 'hgt' do
    where(:value, :result) do
      [
        ['2', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['151gm', false],
        ['149cm', false],
        ['194cm', false],
        ['100cm', false],
        ['58in', false],
        ['77in', false],
        ['63in', true],
        ['150cm', true],
        ['193cm', true],
        ['180cm', true],
        ['59in', true],
        ['76in', true],
        ['65in', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_hgt?(value)).to be result
      end
    end
  end

  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  describe 'hcl' do
    where(:value, :result) do
      [
        ['2', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['123abc3', false],
        ['#123abz', false],
        ['123abc', false],
        ['#123abc', true],
        ['#abc123', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_hcl?(value)).to be result
      end
    end
  end

  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  describe 'ecl' do
    where(:value, :result) do
      [
        ['zzz', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['amb', true],
        ['blu', true],
        ['brn', true],
        ['gry', true],
        ['grn', true],
        ['hzl', true],
        ['oth', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_ecl?(value)).to be result
      end
    end
  end

  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  describe 'pid' do
    where(:value, :result) do
      [
        ['zzz', false],
        [' ', false],
        ['', false],
        [nil, false],
        ['0123456789', false],
        ['1', false],
        ['12345678a', false],
        ['123aa6789', false],
        ['aa3456789', false],
        ['012345678', true],
        ['002345678', true],
        ['002340678', true],
        ['123406789', true],
        ['000000000', true],
        ['000000001', true]
      ]
    end

    with_them do
      it 'returns the correct result' do
        expect(described_class.valid_pid?(value)).to be result
      end
    end
  end
end
