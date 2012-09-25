TrueIf = Module.new do
  define_method :if_true do |&b|
    b.call
    self
  end

  define_method :if_false do self end
end

FalseIf = Module.new do
  define_method :if_false do |&b|
    b.call
    self
  end

  define_method :if_true do self end
end

FalseClass.send :include, FalseIf
NilClass.send :include, FalseIf
Object.send :include, TrueIf

Node = Class.new do
  attr_accessor :left, :right, :value
  protected :left=, :right=, :value=

  define_method :initialize do |value|
    @value = value
  end

  define_method :insert_into do |node, value|
    (value < node.value).if_true {
      node.left.nil?.if_true {
        node.left = Node.new(value)
      }.if_false {
        insert_into node.left, value
      }
    }.if_false {
      node.right.nil?.if_true {
        node.right = Node.new(value)
      }.if_false {
        insert_into node.right, value
      }
    }
  end
end

Tree = Class.new do
  include Enumerable

  define_method :<< do |value|
    @root.nil?.if_true {
      @root = Node.new(value)
    }.if_false {
      @root.insert_into @root, value
    }
  end

  define_method :each do |&b|
    get_value_on @root, &b
  end

  define_method :get_value_on do |node, &b|
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
