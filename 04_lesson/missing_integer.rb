# https://codility.com/programmers/lessons/4-counting_elements/missing_integer/
# Find the minimal positive integer not occurring in a given sequence.
# Score: 100%

require 'test/unit'
require 'benchmark'

class MissingIntegerFinderTest < Test::Unit::TestCase
  def test_call
    assert_equal(2, MissingIntegerFinder.new.call([1]))
    assert_equal(5, MissingIntegerFinder.new.call([1, 3, 6, 4, 1, 2]))
  end
end

class MissingIntegerFinder
  def call(array)
    values = {}
    expected_value = 0

    array.each do |value|
      values[value] = true
    end

    array.size.times do
      expected_value += 1

      return expected_value unless values[expected_value]
    end

    expected_value + 1
  end
end

class MissingIntegerFinderBenchmark
  SET_SIZES = [100, 1_000, 10_000, 100_000]

  def call
    Benchmark.bm(10) do |b|
      SET_SIZES.each do |n|
        array = Array.new(n) { rand(n) }
        b.report("n = #{n}") { MissingIntegerFinder.new.call(array) }
      end
    end
  end
end

# MissingIntegerFinderBenchmark.new.call
