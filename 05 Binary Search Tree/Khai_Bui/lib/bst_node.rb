class BSTNode
  attr_reader :value
  attr_accessor :left, :right
  include Comparable

  def initialize(value)
    @value = value
  end

  def <=>(other_node)
    @value <=> other_node.value
  end
end
