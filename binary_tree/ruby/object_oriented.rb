class Node
  attr_accessor :left, :right, :value
  protected :left=, :right=, :value=

  def initialize(value)
    @value = value
  end

  def insert_into(node, value)
    if value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert_into node.left, value
      end
    else
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert_into node.right, value
      end
    end
  end
end

class Tree
  include Enumerable
  def <<(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.insert_into @root, value
    end
  end

  def each(&b)
    get_value_on @root, &b
  end

  def get_value_on(node, &b)
    get_value_on node.left, &b if node.left
    b.call node.value
    get_value_on node.right, &b if node.right
  end
  private :get_value_on
end

tree = Tree.new
tree << 10
tree << 1
tree << 20
tree << 2
tree << 2
tree << 5
tree << 3
tree << 12
tree << 7
tree << 6
tree << 9
tree << 11
tree << 8

tree.each do |value|
  puts value
end

p tree.to_a
