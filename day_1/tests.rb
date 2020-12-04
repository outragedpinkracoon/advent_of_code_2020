require 'rspec'
require 'script'

RSpec.describe do
  it 'is true' do
    input = [1721,979,366,299,675,1456]
    expect(Day1.run).to be(1)
  end
end
