# https://codility.com/programmers/lessons/6-sorting/distinct/
# Compute number of distinct values in an array.
# Score: 100%

require 'test/unit'

class DistinctValuesCounterTest < Test::Unit::TestCase
  def test_call
    assert_equal(3, DistinctValuesCounter.new.call([2, 1, 1, 2, 3, 1]))
  end
end

class DistinctValuesCounter
  def call(array)
    array.uniq.count
  end
end
