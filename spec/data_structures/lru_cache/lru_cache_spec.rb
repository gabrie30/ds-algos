require 'rspec'
require './lib/data_structures/lru_cache/lru_cache'

describe "LRUCache" do 

  it "will initialize a linked list and a cache" do 
    new_lru = LRUCache.new 
    expect(new_lru).to respond_to(:linked_list, :cache)
  end

  it "it will use a linked list to store values" do 
    lru = LRUCache.new()
    expect(lru.linked_list.class).to eq(LinkedList)
  end

  describe "#get" do 
    it "will return a value, given a key" do 
      lru = LRUCache.new()
      lru.insert("key", "value")
      expect(lru.get("key")).to eq("value")
    end
  end
end