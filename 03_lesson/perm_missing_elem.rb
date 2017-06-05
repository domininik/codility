# https://codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/
# Find the missing element in a given permutation.
# Score: 100%

require 'test/unit'

class MissingElementFinderTest < Test::Unit::TestCase
  def test_call
    assert_equal(4, MissingElementFinder.new.call([2, 3, 1, 5]))
    assert_equal(1, MissingElementFinder.new.call([2, 3, 4, 5]))
    assert_equal(5, MissingElementFinder.new.call([1, 2, 3, 4]))
    assert_equal(1, MissingElementFinder.new.call([]))
    assert_equal(2, MissingElementFinder.new.call([1]))
    assert_equal(1, MissingElementFinder.new.call([2]))
  end
end

class MissingElementFinder
  def call(array)
    array.sort!

    (1..(array.size + 1)).each do |expected_value|
      current_value = array[expected_value-1]

      return expected_value unless current_value == expected_value
    end
  end
end
