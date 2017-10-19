require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
    @store.first
  end

  def push(val)
  end

  public

  def self.child_indices(len, parent_index)
    result = []
    if (parent_index * 2 + 1) < len
      result << (parent_index * 2 + 1)
    end
    if (parent_index * 2 + 2) < len
      result << (parent_index * 2 + 2)
    end
    result
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0

    prc ||= Proc.new { |x, y| y <=> x }
    parent_idx = BinaryMinHeap.parent_index(child_idx)

    until child_idx == 0 || prc.call(child_idx, parent_idx) == 1
      parent_idx = BinaryMinHeap.parent_index(child_idx)
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      child_idx = parent_idx
    end
    array
  end
end
