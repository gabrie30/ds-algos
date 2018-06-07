class MinHeap
  attr_accessor :heap

  def initialize
    @heap = [nil]
  end

  def get_min
    @heap[1]
  end

  def extract_min
    if @heap.length > 2
      min = @heap[1]
      @heap[1] = nil
      last = @heap.pop
      @heap[1] = last
      sink_from_first
      return min
    elsif @heap.length == 1
      return @heap.pop
    end

    return nil
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

  def sink_from_first
    idx = 1
    val = @heap[1]

    total_indexes = @heap.length-1

    while (left_child_index(idx) <= total_indexes && @heap[left_child_index(idx)] < val) || (right_child_index(idx) <= total_indexes && @heap[right_child_index(idx)] < val)
      if left_child_index(idx) <= total_indexes && right_child_index(idx) <= total_indexes
        if @heap[left_child_index(idx)] < @heap[right_child_index(idx)]
          @heap[idx], @heap[left_child_index(idx)] = @heap[left_child_index(idx)], @heap[idx]
          idx = left_child_index(idx)
        elsif @heap[left_child_index(idx)] > @heap[right_child_index(idx)]
          @heap[idx], @heap[right_child_index(idx)] = @heap[right_child_index(idx)], @heap[idx]
          idx = right_child_index(idx)
        end
      else
        # TODO: Handle case where only 2 nodes are left
        return
      end
    end
  end

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
h.add_stream([2,3,1,20,10,0,34,23,12,6,256,22,24,49,11,4,5])
p h.heap
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.extract_min
p h.heap
