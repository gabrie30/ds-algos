class MinHeap
  attr_accessor :heap

  def initialize
    @heap = [nil]
  end

  def get_min
    @heap[1]
  end

  def extract_min

  end

  def insert(node)
    @heap.push(node)
    float_from_last
  end

  def add_stream(stream)
    stream.each do |data|
      insert(data)
    end
  end

  private

  def float_from_last
    idx = @heap.length-1
    val = @heap[idx]

    while parent_index(idx) != 0 && val != nil && val < @heap[parent_index(idx)]
      @heap[parent_index(idx)], @heap[idx] = @heap[idx], @heap[parent_index(idx)]
      idx = parent_index(idx)
    end
  end

  def left_child_index(index)
    (2*index)
  end

  def right_child_index(index)
    (2*index)+1
  end

  def parent_index(index)
    (index / 2)
  end


end


h = MinHeap.new
h.add_stream([2,3,1,20,10,21,32,5,34,0,231,314,3554,31])
p h.heap
p h.get_min
