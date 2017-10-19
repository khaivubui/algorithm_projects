class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid? num
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    !!@store[num]
  end

  private

  def is_valid?(num)
    num <= @max && num > 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20].push(num)
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num % 20].include? num
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    self[num].push(num)
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include? num
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * 2
    new_store = Array.new(new_size) { Array.new }
    @store.each do |bucket|
      bucket.each do |int|
        new_store[int % new_size] << int
      end
    end

    @store = new_store
  end
end
