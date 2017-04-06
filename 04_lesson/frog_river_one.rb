# https://codility.com/programmers/lessons/4-counting_elements/frog_river_one/
# Find the earliest time when a frog can jump to the other side of a river.
# Score: 100%

require 'test/unit'
require 'benchmark'

class TravelTimestampFinderTest < Test::Unit::TestCase
  def test_calculate
    assert_equal(0, TravelTimestampFinder.new(1, [1]).calculate)
    assert_equal(6, TravelTimestampFinder.new(5, [1, 3, 1, 4, 2, 3, 5, 4]).calculate)
    assert_equal(-1, TravelTimestampFinder.new(5, [1, 3, 1, 4, 3, 5, 4, 3]).calculate)
  end
end

class TravelTimestampFinder
  def initialize(distance, array)
    @distance = distance
    @array = array
  end

  def calculate
    steps = {}
    keys_size = 0

    array.each_with_index do |value, index|
      keys_size += 1 unless steps[value]
      steps[value] = true

      return index if keys_size == distance
    end

    -1
  end

  private

  attr_reader :distance, :array
end

class TravelTimestampFinderBenchmark
  SET_SIZES = [100, 1_000, 10_000, 100_000, 1_000_000]

  def call
    Benchmark.bm(10) do |b|
      SET_SIZES.each do |n|
        array = (1..n).to_a.shuffle
        distance = n / 10
        b.report("n = #{n}") { TravelTimestampFinder.new(distance, array).calculate }
      end
    end
  end
end

# TravelTimestampFinderBenchmark.new.call
