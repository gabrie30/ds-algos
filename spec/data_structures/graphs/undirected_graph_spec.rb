require 'rspec'
require 'pry'
require './lib/data_structures/graphs/undirected_graph.rb'

describe Node do
  context "basic getters" do
    before :all do
      @node = Node.new(1)
    end

    it "should respond to value" do
      expect(@node).to respond_to(:value)
    end

    it "should respond to edges" do
      expect(@node).to respond_to(:edges)
    end
  end
end

describe Graph do

  context "basic getters" do
    before :all do
      @graph = Graph.new
    end
    it "should respond to vertices" do
      expect(@graph).to respond_to(:vertices)
    end
  end
end
