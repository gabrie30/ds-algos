class Node  
  attr_accessor :left, :right, :val
  
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end 
end


class Tree
  attr_reader :count
  def initialize
    @root = nil
    @count = 0
  end


  def add_node(val)
    new_node = Node.new(val) 

    if @root.nil?
      @root = new_node
    else
      current = @root

      until (current.val > val && current.left == nil) || (current.val < val && current.right == nil) 
        if current.val > val
          current = current.left
        else
          current = current.right
        end
      end


      if current.val > val
        current.left = new_node
      else
        current.right = new_node
      end
    end

    @count += 1
  end

  def p_dps(current = @root)
    return if current == nil 
    p current.val
    p_dps(current.left) || p_dps(current.right)
  end

  def p_bfs
    return nil if @root == nil
    
    queue = [@root]

    until queue.empty?
      current = queue.shift
      p current.val
      if !current.left.nil?
        queue.push(current.left)
      end
      
      if !current.right.nil?
        queue.push(current.right)
      end
    end
    "Total count is: #{@count}"
  end
end


t = Tree.new

t.add_node(10)
t.add_node(5)
t.add_node(20)
t.add_node(2)
t.add_node(7)
t.add_node(15)
t.add_node(30)
t.add_node(1)
t.add_node(3)
t.add_node(6)
t.add_node(8)
t.add_node(12)
t.add_node(16)
t.add_node(25)
t.add_node(40)


# p t.p_dps
p t.p_bfs