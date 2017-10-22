class BSTNode
  attr_reader :value, :left, :right, :parent
  # include Comparable

  def initialize(value)
    @value = value
  end

  def left=(other_node)
    @left = other_node
    other_node.parent = self
  end

  def right=(other_node)
    @right = other_node
    other_node.parent = self
  end

  # def <=>(other_node)
  #   @value <=> other_node.value
  # end

  protected

  attr_accessor :parent
end
