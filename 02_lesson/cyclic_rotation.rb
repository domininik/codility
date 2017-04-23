# https://codility.com/programmers/lessons/2-arrays/cyclic_rotation/
# Rotate an array to the right by a given number of steps.
# Score: 100%

require 'test/unit'

class CyclicRotationTest < Test::Unit::TestCase
  def test_call
    assert_equal([2, 1], CyclicRotation.new([1, 2], 1).call)
    assert_equal([1, 2], CyclicRotation.new([1, 2], 2).call)
    assert_equal([2, 1], CyclicRotation.new([1, 2], 3).call)
    assert_equal([1, 2], CyclicRotation.new([1, 2], 4).call)
    assert_equal([9, 7, 6, 3, 8], CyclicRotation.new([3, 8, 9, 7, 6], 3).call)
  end
end

class CyclicRotation
  attr_reader :array, :n, :result, :size, :max_index

  def initialize(array, n)
    @array = array
    @n = n
    @result = []
    @size = array.size
    @max_index = size - 1
  end

  def call
    array.each_with_index do |ele, index|
      edited_index = index + n
      new_index = (edited_index > max_index ? edited_index % size : edited_index)
      result[new_index] = ele
    end
    result
  end
end
