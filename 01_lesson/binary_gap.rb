# https://codility.com/programmers/lessons/1-iterations/binary_gap/
# Find longest sequence of zeros in binary representation of an integer.
# Score: 100%

require 'test/unit'

class TestBinaryGapFinder < Test::Unit::TestCase
  def test_gap_size_for
    assert_equal(2, BinaryGapFinder.new.gap_size_for(9))
    assert_equal(4, BinaryGapFinder.new.gap_size_for(529))
    assert_equal(1, BinaryGapFinder.new.gap_size_for(20))
    assert_equal(0, BinaryGapFinder.new.gap_size_for(15))
    assert_equal(5, BinaryGapFinder.new.gap_size_for(1041))
  end
end

class BinaryGapFinder
  def gap_size_for(integer_number)
    binary_number = integer_number.to_s(2)
    groups_of_zeros = binary_number.scan(/1?(0+)1/).flatten

    if groups_of_zeros.any?
      longest_one = groups_of_zeros.sort_by { |g| g.length }.last
      longest_one.size
    else
      0
    end
  end
end
