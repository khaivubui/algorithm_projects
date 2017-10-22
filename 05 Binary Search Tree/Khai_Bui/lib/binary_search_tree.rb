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
        parent_path = 'left'
      when 1
        parent_path = 'right'
      end
      current_node = parent_node.send(parent_path)
    end

    parent_node.send("#{parent_path}=", BSTNode.new(value))
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    
    case value <=> tree_node.value
    when -1, 0
      return nil unless tree_node.left
      find(value, tree_node.left)
    when 1
      return nil unless tree_node.right
      find(value, tree_node.right)
    end
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
