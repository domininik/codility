# https://codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/
# Minimize the value |(A[0] + ... + A[P-1]) - (A[P] + ... + A[N-1])|
# Score: 100%

require 'test/unit'
require 'benchmark'

class MinDiffCalculatorTest < Test::Unit::TestCase
  def test_calculate
    assert_equal(1, MinDiffCalculator.new.calculate([3, 1, 2, 4, 3]))
    assert_equal(20, MinDiffCalculator.new.calculate([-10, 10]))
    assert_equal(0, MinDiffCalculator.new.calculate([0, -2, 1, 1, -2, 2]))
  end
end

class MinDiffCalculator
  def calculate(array)
    total_sum = array.reduce(:+)
    part_sum = 0
    result = nil

    array[0..-2].each do |value|
      part_sum += value
      diff = (total_sum - 2 * part_sum).abs
      result = diff unless result
      result = diff if diff < result
    end

    result
  end
end

class MinDiffCalculatorBenchmark
  SET_SIZES = [100, 1_000, 10_000, 100_000, 1_000_000]

  def call
    Benchmark.bm(10) do |b|
      SET_SIZES.each do |n|
        array = Array.new(n) { rand(n) }
        b.report("n = #{n}") { MinDiffCalculator.new.calculate(array) }
      end
    end
  end
end

# MinDiffCalculatorBenchmark.new.call
#                  user     system      total        real
# n = 100      0.000000   0.000000   0.000000 (  0.000653)
# n = 1000     0.050000   0.000000   0.050000 (  0.052645)
# n = 10000    4.960000   0.010000   4.970000 (  4.971292)

#                  user     system      total        real
# n = 100      0.000000   0.000000   0.000000 (  0.000043)
# n = 1000     0.000000   0.000000   0.000000 (  0.000279)
# n = 10000    0.000000   0.000000   0.000000 (  0.002572)
# n = 100000   0.040000   0.000000   0.040000 (  0.036451)
# n = 1000000  0.330000   0.010000   0.340000 (  0.345214)

#                  user     system      total        real
# n = 100      0.000000   0.000000   0.000000 (  0.000027)
# n = 1000     0.000000   0.000000   0.000000 (  0.000164)
# n = 10000    0.000000   0.000000   0.000000 (  0.001594)
# n = 100000   0.020000   0.000000   0.020000 (  0.016668)
# n = 1000000  0.160000   0.000000   0.160000 (  0.164395)
