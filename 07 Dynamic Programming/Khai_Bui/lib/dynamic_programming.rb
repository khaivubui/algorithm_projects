class DynamicProgramming

  def initialize
    @blair_cache = {
      0 => 0,
      1 => 1,
      2 => 2
    }
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]

    prev_blair = @blair_cache[n - 1] || blair_nums(n - 1)
    prev_prev_blair = @blair_cache[n - 2] || blair_nums(n - 2)

    result = prev_blair + prev_prev_blair + n * 2 - 3

    @blair_cache[n] = result
    result
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
    @frog_cache[n]
  end

  def frog_cache_builder(n)
    @frog_cache = [
      [],
      [[1]],
      [[1, 1], [2]],
      [[1, 1, 1], [1, 2], [2, 1], [3]],
      # [[1, 1, 1, 1], [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2], [1, 3], [3, 1]]
    ]

    (4..n).each do |num|
      @frog_cache[num] = @frog_cache[0..num].reduce(&:+)
        .reject { |sub_arr| num - sub_arr.reduce(&:+) > 3 }
        .map { |sub_arr| sub_arr + [num - sub_arr.reduce(&:+)] }
    end

    @frog_cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
