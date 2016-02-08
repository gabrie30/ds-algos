class Node

  attr_accessor :value
  attr_accessor :next

  def value
    @value
  end

  def next
    @next
  end

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

  def append(val)
    if @head == nil
      @head = Node.new(val)
      @tail = Node.new(val)
    else
      current = @head 
      until current.next == nil
        current = current.next
      end

      current.next = Node.new(val)
      @tail = current.next
    end
    @listLength += 1
  end


  # check if there is no head
  # check if current node to insert after is tail
  # handle if search value does not exist
  def insert(insertVal, searchVal)
    if @head == nil
      return false
    else
      current = @head
      until current.value == searchVal
        if current.next == nil
          return nil
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

  end

  # handle deleting the head (with 1 and 2 elements only)
  # handle deleting the tail
  def delete(val)
    if @head.nil?
      return "List is empty"
    end

    return if val >= @listLength

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
    if @head == nil
      return false
    end

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