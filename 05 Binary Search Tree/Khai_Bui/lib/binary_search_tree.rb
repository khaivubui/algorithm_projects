require 'bst_node'

# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    return @root = BSTNode.new(value) unless @root

    current_node = @root
    while current_node
      parent_node = current_node

      case value <=> parent_node.value
      when -1, 0
        current_node = parent_node.left
        parent_path = 'left'
      when 1
        current_node = parent_node.right
        parent_path = 'right'
      end
    end

    parent_node.send("#{parent_path}=", BSTNode.new(value))
  end

  def find(value, tree_node = @root)
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end

  private
  # optional helper methods go here:

end
