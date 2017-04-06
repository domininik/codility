# https://codility.com/programmers/lessons/7-stacks_and_queues/brackets/
# Determine whether a given string of parentheses is properly nested.
# Score: 100%

require 'test/unit'

class BracketsValidatorTest < Test::Unit::TestCase
  def test_valid?
    assert_equal(1, BracketsValidator.new.valid?('{}'))
    assert_equal(1, BracketsValidator.new.valid?('{[()()]}'))
    assert_equal(0, BracketsValidator.new.valid?('([)()]'))
  end
end

class BracketsValidator
  LEFT_SIDE_BRACKETS = ['{', '[', '(']
  RIGHT_SIDE_BRACKETS = ['}', ']', ')']

  def initialize
    @stack = []
  end

  def valid?(string)
    chars = string.split(//)

    chars.each do |char|
      if LEFT_SIDE_BRACKETS.include?(char)
        stack << char
      elsif RIGHT_SIDE_BRACKETS.include?(char)
        last_on_stack = stack.last

        if matching_brackets?(last_on_stack, char)
          stack.pop
        else
          stack << char
        end
      end
    end

    stack.empty? ? 1 : 0
  end

  private

  attr_reader :stack

  def matching_brackets?(left_side_bracket, right_side_bracket)
    LEFT_SIDE_BRACKETS.index(left_side_bracket) == RIGHT_SIDE_BRACKETS.index(right_side_bracket)
  end
end
