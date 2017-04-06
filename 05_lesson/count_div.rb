# https://codility.com/programmers/lessons/5-prefix_sums/count_div/
# Compute number of integers divisible by k in range [a..b].
# Score: 100%

require 'test/unit'
require 'benchmark'

class DivCounterTest < Test::Unit::TestCase
  def test_calculate
    assert_equal(3, DivCounter.new.calculate(6, 11, 2))
    assert_equal(0, DivCounter.new.calculate(1, 2, 3))
    assert_equal(20, DivCounter.new.calculate(11, 345, 17))
  end
end

class DivCounter
  def calculate(range_start, range_end, modulo_value)
    result = range_end / modulo_value
    result -= (range_start - 1) / modulo_value
    result
  end
end

class DivCounterBenchmark
  SET_SIZES = [1_000_000, 10_000_000, 100_000_000]

  def call
    Benchmark.bm(20) do |b|
      SET_SIZES.each do |n|
        b.report("n = #{n}") { DivCounter.new.calculate(0, n, 2) }
      end
    end
  end
end

# DivCounterBenchmark.new.call
