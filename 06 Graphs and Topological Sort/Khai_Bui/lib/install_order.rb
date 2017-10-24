# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  vertices_hash = {}
  arr.each do |tuple|
    tuple.each do |file|
      unless vertices_hash[file]
        vertices_hash[file] = Vertex.new(file)
      end
    end

    Edge.new(vertices_hash[tuple[1]], vertices_hash[tuple[0]])
  end

  no_dependencies = (0..9).to_a - vertices_hash.keys
  topological_sort(vertices_hash.values).map(&:value) + no_dependencies
end
