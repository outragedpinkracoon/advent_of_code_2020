# frozen_string_literal: true

# Shared file utilites for tests
module TestHelper
  def read_file_as_ints(file_name)
    File.read(file_name).split.map(&:to_i)
  end
end
