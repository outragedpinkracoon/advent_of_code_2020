# frozen_string_literal: true

# Validates the keys in the passport fields
module PassportKeysValidator
  def self.run(fields)
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
