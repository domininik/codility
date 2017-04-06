# https://codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
# Find value that occurs in odd number of elements.
# Score: 100%

require 'test/unit'

class UnpairedElementFinderTest < Test::Unit::TestCase
  def test_find_for
    assert_equal(7, UnpairedElementFinder.new.find_for([9, 3, 9, 3, 9, 7, 9]))
    assert_equal(7, UnpairedElementFinder.new.find_for([9, 3, 9, 3, 9, 7, 9, 7, 7]))
  end
end

class UnpairedElementFinder
  def find_for(array)
    occurrences = Hash.new(0)

    array.each { |number| occurrences[number] += 1 }

    occurrences.find { |key, value| value % 2 != 0 }[0]
  end
end
