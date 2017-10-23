require 'binary_search_tree'

def kth_largest(tree_node, k)
  tree = tree_node.tree
  kth_largest_value = tree.in_order_traversal(tree_node)[-k]
  tree.find(kth_largest_value)
end
