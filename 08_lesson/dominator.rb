# https://codility.com/programmers/lessons/8-leader/dominator/
# Find an index of an array such that its value occurs at more than half of indices in the array.
# Score: 100%

require 'test/unit'

class DominatorTest < Test::Unit::TestCase
  def test_find
    assert_equal(-1, Dominator.new([1, 2, 3, 4, 5]).indexes)
    assert_equal(-1, Dominator.new([1, 2, 1, 2]).indexes)
    assert_equal(1, Dominator.new([1, 2, 2]).indexes)
    assert_equal(0, Dominator.new([3, 4, 3, 2, 3, -1, 3, 3]).indexes)
    assert_equal(-1, Dominator.new([]).indexes)
    assert_equal(0, Dominator.new([1]).indexes)
  end
end

class Dominator
  def initialize(array)
    @array = array
    @indexes_of_values = {}
  end

  def indexes
    array.each_with_index do |value, index|
      indexes_of_values[value] = [] unless indexes_of_values[value]
      indexes_of_values[value] << index
    end

    indexes_of_most_popular_value = indexes_of_values.values.sort_by{ |ele| ele.size }.last

    if indexes_of_most_popular_value && indexes_of_most_popular_value.size > array_size / 2
      indexes_of_most_popular_value.first
    else
      -1
    end
  end

  private

  attr_reader :array, :indexes_of_values

  def array_size
    @array_size ||= array.size
  end
end
