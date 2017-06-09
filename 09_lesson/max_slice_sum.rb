# https://codility.com/programmers/lessons/9-maximum_slice_problem/max_slice_sum/
# Find a maximum sum of a compact subsequence of array elements.
# Score: 100%

require 'test/unit'
require 'benchmark'

class MaxSliceSumTest < Test::Unit::TestCase
  def test_calculate
    assert_equal(5, MaxSliceSum.new([3, 2, -6, 4, 0]).calculate)
    assert_equal(5, MaxSliceSum.new([-4, 1, -3, 2, 3, -1, 0]).calculate)
    assert_equal(2, MaxSliceSum.new([2]).calculate)
    assert_equal(-3, MaxSliceSum.new([-3]).calculate)
    assert_equal(-1, MaxSliceSum.new([-3, -1]).calculate)
  end
end

class MaxSliceSum
  attr_reader :array, :max_sum, :current_max, :result

  def initialize(array)
    @array = array
    @max_sum = 0
    @current_max = nil
    @result = 0
  end

  def calculate
    array.each do |ele|
      @current_max = if current_max
        ele > current_max ? ele : current_max
      else
        ele
      end

      current_sum = max_sum + ele
      @max_sum = current_sum > 0 ? current_sum : 0
      @result = result > max_sum ? result : max_sum
    end

    result == 0 ? current_max : result
  end
end

class MaxSliceSumBenchmark
  SET_SIZES = [100, 100_000, 100_000]

  def call
    Benchmark.bm(20) do |b|
      SET_SIZES.each do |n|
        array = Array.new(n) { rand(n) }
        b.report("n = #{n}") { MaxSliceSum.new(array).calculate }
      end
    end
  end
end

# MaxSliceSumBenchmark.new.call
#                            user     system      total        real
# n = 100                0.000000   0.000000   0.000000 (  0.000025)
# n = 100000             0.020000   0.000000   0.020000 (  0.017044)
# n = 100000             0.020000   0.000000   0.020000 (  0.019431)


