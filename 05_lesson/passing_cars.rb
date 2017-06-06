# https://codility.com/programmers/lessons/5-prefix_sums/passing_cars/
# Count the number of passing cars on the road.
# Score: 100%

require 'test/unit'
require 'benchmark'

class PassingCarsCalculatorTest < Test::Unit::TestCase
  def test_call
    assert_equal(4, PassingCarsCalculator.new([0, 0, 0, 0, 1]).call)
    assert_equal(5, PassingCarsCalculator.new([0, 1, 0, 1, 1]).call)
    assert_equal(0, PassingCarsCalculator.new([1, 1, 1, 1, 1]).call)
    assert_equal(2, PassingCarsCalculator.new([1, 1, 0, 1, 1]).call)
    assert_equal(2, PassingCarsCalculator.new([1, 1, 0, 0, 1]).call)
    assert_equal(0, PassingCarsCalculator.new([1, 1, 1, 0, 0]).call)
  end
end

class PassingCarsCalculator
  MAX_COUNT = 1_000_000_000

  attr_reader :array, :number_of_zeros, :total_count

  def initialize(array)
    @array = array
    @number_of_zeros = 0
    @total_count = 0
  end

  def call
    array.each do |ele|
      case ele
      when 0
        @number_of_zeros += 1
      when 1
        @total_count += number_of_zeros
      end
      return -1 if total_count > MAX_COUNT
    end
    total_count
  end
end

class PassingCarsCalculatorBenchmark
  SET_SIZES = [1_000, 10_000, 100_000, 1_000_000]

  def call
    Benchmark.bm(20) do |b|
      SET_SIZES.each do |n|
        array = Array.new(n) { rand(2) }
        b.report("n = #{n}") { PassingCarsCalculator.new(array).call }
      end
    end
  end
end

# PassingCarsCalculatorBenchmark.new.call
#                            user     system      total        real
# n = 1000               0.000000   0.000000   0.000000 (  0.000111)
# n = 10000              0.000000   0.000000   0.000000 (  0.000996)
# n = 100000             0.010000   0.000000   0.010000 (  0.008898)
# n = 1000000            0.010000   0.000000   0.010000 (  0.008970)
