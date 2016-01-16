require 'rspec'
require './lib/algorithms/sort/insertion_sort'

describe '#insertion_sort' do 
  it 'should sort an unsorted array' do 
    expect(insertion_sort([3,2,1])).to eq([1,2,3])
  end

  it 'should handle an empty array' do 
    expect(insertion_sort([])).to eq([])
  end
end