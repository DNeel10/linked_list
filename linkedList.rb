# frozen_string_literal: true

# Class that allows a linked list to be created with the sub class Node
class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def append(node)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def size
    counter = 0
    node = @head
    while node
      node = node.next_node
      counter += 1
    end
    counter
  end

  def head
    return nil if @head.nil?

    @head
  end

  def tail
    return nil if @tail.nil?

    @tail
  end

  def at(index)
    node = @head
    counter = 0
    while counter < index
      node = node.next_node
      counter += 1
    end
    node
  end

  def insert_at(value, index)
    node = @head
    counter = 0

    while counter < index - 1
      node = node.next_node
      counter += 1
    end
    previous_node = node
    node = Node.new(value, previous_node.next_node)
    previous_node.next_node = node
  end

  def remove_at(index)
    node = @head
    counter = 0

    while counter < index
      previous_node = node
      node = node.next_node
      counter += 1
    end
    previous_node.next_node = node.next_node
  end

  def pop
    return nil if head.nil?

    current_node = @head
    prev_node = nil
    while current_node.next_node
      prev_node = current_node
      current_node = current_node.next_node
    end
    prev_node.next_node = current_node.next_node
    current_node
  end

  def contains?(value)
    node = @head
    while node
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    while node
      return node if node.value == value

      node = node.next_node
    end
    'Value not present'
  end

  def to_s
    node = @head
    list = "(#{node})"
    counter = 0
    while counter < self.size - 1
      list << " -> (#{node.next_node})"
      node = node.next_node
      counter += 1
    end
    list << ' -> nil'
    list
  end
end

# Creates a node with a value and a pointer to the next node in the list
class Node
  attr_accessor :value, :next_node

  @@number_of_nodes = 0

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
    @@number_of_nodes += 1
  end

  def self.count
    @@number_of_nodes
  end
end

# testing some different methods

list1 = LinkedList.new

list1.prepend(Node.new(100))
list1.prepend(Node.new(40))
puts list1
# list1.append(Node.new(30))
# list1.prepend(Node.new(60))
# puts list1.size
# puts "Head: #{list1.head}"
# puts "Tail: #{list1.tail}"
# puts list1
# puts list1.contains?(490)
# puts list1.find(40)
# puts list1.at(2)
# puts list1.pop
list1.insert_at(20, 2)
puts list1
list1.remove_at(2)
puts list1
