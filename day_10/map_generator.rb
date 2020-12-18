# frozen_string_literal: true

# Generates the input hash for the algorithm
module MapGenerator
  def self.run(input)
    adapters = input.map(&:to_i).sort.unshift(0)
    adapters << adapters.last + 3
    result = {}
    adapters.each_with_index do |a, i|
      result[a] = adapters[i + 1...adapters.size].select { |item| item - a <= 3 }
    end
    result
  end
end
