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
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def size
    Node.count
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
  end

  def pop
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
    "(#{self.head}) -> (#{self.tail})"
  end

end

class Node
  attr_accessor :value, :next_node
  @@number_of_nodes = 0

  def initialize value = nil, next_node = nil
    @value = value
    @next_node = next_node
    @@number_of_nodes += 1
  end

  def self.count
    @@number_of_nodes
  end
end

list1 = LinkedList.new

list1.prepend(Node.new(100))
list1.prepend(Node.new)
list1.prepend(Node.new)
list1.prepend(Node.new)
puts list1.size
puts "Head: #{list1.head}"
puts "Tail: #{list1.tail}"
puts list1