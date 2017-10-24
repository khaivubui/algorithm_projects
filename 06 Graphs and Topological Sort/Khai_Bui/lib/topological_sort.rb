require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []

  vertices.each do |vertex|
    top << vertex if vertex.in_edges.empty?
  end

  until top.empty?
    current = top.shift
    sorted << current

    current.out_edges.each do |edge|
      destination = edge.to_vertex

      top << destination if destination.in_edges.length == 1
      edge.destroy!
    end
  end

  sorted
end
