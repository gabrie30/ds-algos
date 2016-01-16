require 'rspec'
require 'search'

describe '#binary_search' do 

  it 'should return nil if target is not in array' do 
    expect(binary_search([1,2,3], 10)).to eq(nil)
    expect(binary_search([1,2,3], -10)).to eq(nil)
  end

  it 'should return the index of the target when found' do 
    expect(binary_search([1,2,3], 2)).to eq(1) 
    expect(binary_search([1,2,3,100], 100)).to eq(3) 
  end
end