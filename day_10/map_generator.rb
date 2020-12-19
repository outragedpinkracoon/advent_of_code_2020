# frozen_string_literal: true

# Generates the input hash for the algorithm
module MapGenerator
  # Generate a map of all the numbers in the starting set, where the children of the node
  # are only valid paths
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
