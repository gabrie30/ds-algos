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

    it "should respond to total vertices" do
      expect(@graph).to respond_to(:total_vertices)
    end
  end

  context "verticies" do
    before :each do
      @graph = Graph.new
    end

    it "should be able to add vertices" do
      expect(@graph.total_vertices).to eq(0)
      @graph.add_vertex(1)
      expect(@graph.total_vertices).to eq(1)
    end

    it "should be able to remove vertices" do
      @graph.add_vertex(10)
      expect(@graph.total_vertices).to eq(1)
      @graph.remove_vertex(10)
      expect(@graph.total_vertices).to eq(0)
    end
  end

  context "edges" do
    before :each do
      @graph = Graph.new
    end

    it "should be able to add edges" do
      @graph.add_vertex(1)
      @graph.add_vertex(2)
      expect(@graph.total_edges).to eq(0)
      @graph.add_edge(1,2)
      expect(@graph.total_edges).to eq(1)
    end

    it "should be able to remove edges" do
      @graph.add_vertex(1)
      @graph.add_vertex(2)
      expect(@graph.total_edges).to eq(0)
      @graph.add_edge(1,2)
      expect(@graph.total_edges).to eq(1)
      @graph.remove_edge(1,2)
      expect(@graph.total_edges).to eq(0)
    end
  end
end
