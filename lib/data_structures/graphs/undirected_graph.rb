class Node
  attr_accessor :value,:edges

  def initialize(id)
    @value = id
    @edges = {}
  end
end

class Graph
  attr_accessor :vertices, :total_vertices, :total_edges

  def initialize()
    @vertices = {}
    @total_vertices = 0
    @total_edges = 0
  end

  def add_vertex(int)
    if @vertices[int]
      return
    else
      new_vertex = Node.new(int)
      @vertices[int] = new_vertex
      @total_vertices += 1
    end
  end

  def get_vertex(id)
    @vertices[id] ? @vertices[id] : nil
  end

  def remove_vertex(id)
    if @vertices[id]
      vertex = @vertices[id]
      vertex.edges.each do |edge_id|
        @vertices[edge_id].edges.delete(id)
      end
      @vertices.delete(id)
      @total_vertices -= 1
    else
      return nil
    end
  end

  def add_edge(id1, id2)
    if @vertices[id1] && @vertices[id2]
      @vertices[id1].edges[id2] = id2
      @vertices[id2].edges[id1] = id1
      @total_edges += 1
    else
      return nil
    end
  end

  def remove_edge(id1, id2)
    if @vertices[id1] && @vertices[id2]
      if @vertices[id1].edges.has_key?(id2) && @vertices[id2].edges.has_key?(id1)
        @vertices[id1].edges.delete(id2)
        @vertices[id2].edges.delete(id1)
        @total_edges -= 1
      else
        return nil
      end
    else
      return nil
    end
  end

  def find_neighbors(id)
    if @vertices[id]
      return @vertices[id].edges
    else
      return nil
    end
  end
end

g = Graph.new
g.add_vertex(1)
g.add_vertex(2)
g.add_vertex(3)
g.add_edge(1,2)
g.add_edge(1,3)
p g


