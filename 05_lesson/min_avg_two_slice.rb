# https://codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/
# Find the minimal average of any slice containing at least two elements.
# Score: 100%

require 'test/unit'

class MinAvgStartFinderTest < Test::Unit::TestCase
  def test_call
    assert_equal(1, MinAvgStartFinder.new([4, 2, 2, 5, 1, 5, 8]).call)
  end
end

class MinAvgStartFinder
  attr_reader :array, :start_point_avg_mins, :start_points_range, :slice_sizes

  def initialize(array)
    @array = array
    @start_point_avg_mins = {}
    @start_points_range = (0..(array.size - 2))
    @slice_sizes = [2, 3]
  end

  def call
    start_points_range.each do |start_point|
      averages = []

      slice_sizes.each do |slice_size|
        end_point = start_point + slice_size - 1
        slice = array[start_point..end_point]
        avg_value = slice.reduce(:+) / slice.count.to_f
        averages << avg_value
      end

      start_point_avg_mins[start_point] = averages.min
    end

    min_avg_from_all = start_point_avg_mins.values.min
    start_point_avg_mins.key(min_avg_from_all)
  end
end
