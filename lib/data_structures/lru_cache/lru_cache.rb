# First attempt at an LRU Cache
# The idea is to take a Hash Map and use the unique data as the key
# Then instead the value would be Node of a doubly linked list
# All opperations can be perfomed in constant time

require "pry"

class LRUCache

  attr_reader :linked_list, :cache

  def initialize
    @linked_list = LinkedList.new
    @cache = Hash.new
  end

  def insert(key, value)
    new_node = @linked_list.insert(key, value)
    @cache[key] = new_node
  end

  def get(key)
    @cache[key].val
  end

end


class Node

  attr_accessor :next, :prev, :val, :key

  def initialize(key, val, left=nil, right=nil)
    @next  = left
    @prev  = right
    @val   = val
    @key   = key
  end
end


class LinkedList

  attr_reader :head, :tail, :list_length, :val, :key

  def initialize
    @tail = nil
    @head = nil
    @list_length = 0
  end

  def included?(val, node=@head)
    
    return false if node.nil?
    return true  if node.val == val

    included?(val, node.next)
  end

  def insert(key, val)

    return "already in the list" if included?(val)

    if @head.nil?
      new_node = @head = Node.new(key, val)
    else
      if @tail.nil?
        # there is a head but not yet a tail
        new_node = @tail = Node.new(key, val)
        @tail.prev = @head
        @head.next = @tail
      else
        # there is both a head and a tail
        current = @tail
        new_node = Node.new(key, val)
        current.next = new_node
        new_node.prev = current
        @tail = new_node
      end
    end

    @list_length += 1
    return new_node
  end

  def delete(val)
    # if it is head
    return "not in list" unless included?(val)

    if @head.val == val 
      if @head.next.nil?
        @head = nil
        @tail = nil
        @list_length = 0
      else
        new_head = @head.next 
        @head.next = nil 
        @head = new_head
        new_head.prev = nil
        @list_length -= 1
      end
      return
    end

    # if it is tail
    if @tail.val == val
      current = @tail
      @tail = current.prev
      current.prev.next = nil
      @list_length -= 1
      return
    end

    # any other value besides head/tail
    target = @head 
    until target.val == val 
      target = target.next 
    end

    left = target.prev
    right = target.next

    left.next = right 
    right.prev = left 

    target.next = nil
    target.prev = nil 

    @list_length -= 1
  end
end

a = LRUCache.new
a.insert("my_key", "my_value")
a.insert("hello", "world")
a.insert("good", "day")

