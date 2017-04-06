# https://codility.com/programmers/lessons/7-stacks_and_queues/nesting/
# Determine whether given string of parentheses is properly nested.
# Score: 100%

require 'test/unit'

class ParenthesesValidatorTest < Test::Unit::TestCase
  def test_valid?
    assert_equal(1, ParenthesesValidator.new.valid?('(()(())())'))
    assert_equal(0, ParenthesesValidator.new.valid?('())'))
  end
end

class ParenthesesValidator
  attr_reader :stack

  LEFT_ONE = '('
  RIGHT_ONE = ')'

  def initialize
    @stack = []
  end

  def valid?(string)
    string.split(//).each do |char|
      case char
      when LEFT_ONE
        stack << char
      when RIGHT_ONE
        last_on_stack = stack.last
        if last_on_stack == LEFT_ONE
          stack.pop
        else
          stack << char
        end
      end
    end

    stack.empty? ? 1 : 0
  end
end
