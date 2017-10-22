class BSTNode
  attr_reader :value, :left, :right
  attr_accessor :parent
  # include Comparable

  def initialize(value)
    @value = value
  end

  def parent_path
    return nil unless parent
    if parent.left === self
      'left'
    else
      'right'
    end
  end

  def left=(other_node)
    @left = other_node
    if other_node
      other_node.parent = self
    end
  end

  def right=(other_node)
    @right = other_node
    if other_node
      other_node.parent = self
    end
  end

  # def <=>(other_node)
  #   @value <=> other_node.value
  # end
end
