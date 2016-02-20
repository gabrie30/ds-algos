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
    @totalVertices = 0
    @totalEdges = 0
  end

  def add_vertex(int)
    if @vertices[int]
      return
    else
      new_vertex = Node.new(int)
      @vertices[int] = new_vertex
      @totalVertices += 1
    end
  end

  def getVertex(id)
    @vertices[id] ? @vertices[id] : nil
  end

  def removeVertex(id)
    if @vertices[id]
      vertex = @vertices[id] 
      vertex.edges.each do |edge_id|
        @vertices[edge_id].edges.delete(id)
      end
      @vertices.delete(id)
      @totalVertices -= 1
    else
      return nil
    end
  end

  def addEdge(id1, id2)                   
    if @vertices[id1] && @vertices[id2]
      @vertices[id1].edges[id2] = id2
      @vertices[id2].edges[id1] = id1 
      @totalEdges += 1
    else
      return nil
    end
  end

  def removeEdge(id1, id2)
    if @vertices[id1] && @vertices[id2]
      if @vertices[id1].edges.has_key?(id2) && @vertices[id2].edges.has_key?(id1)
        @vertices[id1].edges.delete(id2)
        @vertices[id2].edges.delete(id1)
        @totalEdges -= 1
      else
        return nil 
      end
    else
      return nil 
    end
  end

  def findNeighbors(id)
    if @vertices[id]
      return @vertices[id].edges
    else
      return nil
    end 
  end
end

