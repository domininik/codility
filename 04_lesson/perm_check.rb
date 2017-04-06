# https://codility.com/programmers/lessons/4-counting_elements/perm_check/
# Check whether array A is a permutation.
# Score: 100%

require 'test/unit'
require 'benchmark'

class PermutationCheckerTest < Test::Unit::TestCase
  def test_is_valid?
    assert_equal(1, PermutationChecker.new.is_valid?([4, 1, 3, 2]))
    assert_equal(0, PermutationChecker.new.is_valid?([4, 1, 3]))
  end
end

class PermutationChecker
  def is_valid?(array)
    values = {}

    array.each do |value|
      values[value] = true
    end

    array.each_index do |index|
      return 0 unless values[index + 1]
    end

    1
  end
end

class PermutationCheckerBenchmark
  SET_SIZES = [100, 1_000, 10_000, 100_000]

  def call
    Benchmark.bm(10) do |b|
      SET_SIZES.each do |n|
        array = (1..n).to_a
        b.report("n = #{n}") { PermutationChecker.new.is_valid?(array) }
      end
    end
  end
end

# PermutationCheckerBenchmark.new.call
#                  user     system      total        real
# n = 100      0.000000   0.000000   0.000000 (  0.000038)
# n = 1000     0.000000   0.000000   0.000000 (  0.000359)
# n = 10000    0.000000   0.000000   0.000000 (  0.003539)
# n = 100000   0.060000   0.000000   0.060000 (  0.062334)
