# https://codility.com/programmers/lessons/3-time_complexity/frog_jmp/
# Count minimal number of jumps from position X to Y.
# Score: 100%

require 'test/unit'

class NumberOfJumpsCalculatorTest < Test::Unit::TestCase
  def test_calculate
    assert_equal(3, NumberOfJumpsCalculator.new.calculate(10, 85, 30))
  end
end

class NumberOfJumpsCalculator
  def calculate(position, target, jump_range)
    ((target - position) / jump_range.to_f).ceil
  end
end
