# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store, :max_history

  def initialize
    @in_stack = RingBuffer.new
    @in_stack_max_history = RingBuffer.new
    @out_stack = RingBuffer.new
    @out_stack_max_history = RingBuffer.new
  end

  def enqueue(val)
    @in_stack.push(val)
    if @in_stack_max_history.length == 0 ||
       val > @in_stack_max_history[@in_stack_max_history.length - 1]
      @in_stack_max_history.push(val)
    end
  end

  def dequeue
    queueify if @out_stack.length == 0
    popped = @out_stack.pop
    if @out_stack_max_history.length > 0 &&
       popped == @out_stack_max_history[@out_stack_max_history.length - 1]
      @out_stack_max_history.pop
    end
    popped
  end

  def max
    in_max = @in_stack_max_history[@in_stack_max_history.length - 1]
    out_max = @out_stack_max_history[@out_stack_max_history.length - 1]
    return in_max unless out_max
    return in_max if in_max && in_max > out_max
    out_max
  end

  def length
    @in_stack.length + @out_stack.length
  end

  private

  def queueify
    until @in_stack.length == 0
      popped = @in_stack.pop
      @out_stack.push(popped)
      if @in_stack_max_history.length > 0 &&
         popped == @in_stack_max_history[@in_stack_max_history.length - 1]
        @in_stack_max_history.pop
      end
      if @out_stack_max_history.length == 0 ||
         popped > @out_stack_max_history[@out_stack_max_history.length - 1]
        @out_stack_max_history.push(popped)
      end
    end
  end
end
