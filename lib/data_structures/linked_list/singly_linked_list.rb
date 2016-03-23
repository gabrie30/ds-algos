class Node

  attr_accessor :value
  attr_accessor :next

  def initialize(val)
    @value = val
    @next = nil
  end
end

class Linked_List

  attr_reader :head
  attr_reader :tail
  attr_reader :listLength

  def initialize()
    @head = nil
    @tail = nil
    @listLength = 0
  end


  # use the tail to insert the new node, making it constant time.
  # check if the length is zero or head is nil, there is no head or tail
  # if there is something in the LL there are no other conditions to watch out for
  def append(val)
    if @head == nil
      @head = @tail = Node.new(val)
    else
      current = @tail
      current.next = Node.new(val)
      @tail = current.next
    end

    @listLength += 1
  end


  # check if there is no head
  # check if current node to insert after is tail
  # handle if search value does not exist
  def insert(insertVal, searchVal)
    return false if @head == nil
      
    current = @head
    until current.value == searchVal
      if current.next == nil
        return "The search value is not in this Linked List"
      end

      current = current.next 
    end

    if current == @tail 
      current.next = Node.new(insertVal)
      @tail = current.next
    else
      new_next = current.next
      current.next = Node.new(insertVal)
      current.next.next = new_next
    end
  end

  # handle an empty list
  # handle deleting the head && with one other node
  # handle deleting the tail
  def delete(val)
    return "List is empty" if @head.nil?
    return "The index is not in the list" if val >= @listLength

    current = @head
    current_index = 0

    until current_index == val
      previous = current
      current = current.next
      current_index += 1
    end

    if val == 0 && @listLength == 1
      @head = nil
      @tail = nil 
    elsif val == 0 && @listLength == 2
      @head = current.next
      @tail = current.next 
    elsif val == 0 && @listLength > 2
      @head = current.next
    elsif val == @listLength-1
      previous.next = nil
      @tail = previous
    else
      previous.next = current.next
    end

    @listLength -= 1
  end

  def contains(val)
    return false if @head == nil

    current = @head
    until current == @tail
      if current.value == val
        return true
      end
      current = current.next
    end
    current.value == val ? true : false
  end
end
