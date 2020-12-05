# frozen_string_literal: true

# Validates the values in the passport fields
module PassportValuesValidator
  def self.run(fields)
    valid_byr?(fields['byr']) &&
      valid_iyr?(fields['iyr']) &&
      valid_eyr?(fields['eyr']) &&
      valid_hgt?(fields['hgt']) &&
      valid_hcl?(fields['hcl']) &&
      valid_ecl?(fields['ecl']) &&
      valid_pid?(fields['pid'])
  end

  def self.valid_byr?(raw_value)
    valid_date_range?(raw_value, 4, 1920, 2002)
  end

  def self.valid_iyr?(raw_value)
    valid_date_range?(raw_value, 4, 2010, 2020)
  end

  def self.valid_eyr?(raw_value)
    valid_date_range?(raw_value, 4, 2020, 2030)
  end

  def self.valid_hgt?(raw_value)
    !!raw_value && (valid_inches?(raw_value) || valid_centimeters?(raw_value))
  end

  def self.valid_hcl?(raw_value)
    !raw_value.nil? &&
      raw_value.size == 7 &&
      raw_value.start_with?('#') &&
      valid_hex?(raw_value)
  end

  def self.valid_hex?(raw_value)
    valid_chars = (0..9).to_a.map(&:to_s) + ('a'..'f').to_a
    hex_code = raw_value.split('').drop(1)
    hex_code.all? do |value|
      valid_chars.include?(value)
    end
  end

  def self.valid_ecl?(raw_value)
    valid_values = %w[amb blu brn gry grn hzl oth]
    !!raw_value && valid_values.include?(raw_value)
  end

  def self.valid_pid?(raw_value)
    return false unless raw_value && raw_value.size == 9

    valid_values = (0..9).to_a.map(&:to_s)
    raw_value.split('').all? do |value|
      valid_values.include?(value)
    end
  end

  def self.valid_inches?(raw_value)
    value = raw_value.to_i
    raw_value.include?('in') && value >= 59 && value <= 76
  end

  def self.valid_centimeters?(raw_value)
    value = raw_value.to_i
    raw_value.include?('cm') && value >= 150 && value <= 193
  end

  def self.valid_date_range?(raw_value, max_size, min_value, max_value)
    value = raw_value.to_i
    !raw_value.nil? &&
      raw_value.size == max_size &&
      value <= max_value &&
      value >= min_value
  end
end
