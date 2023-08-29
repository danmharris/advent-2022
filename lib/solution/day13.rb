# frozen_string_literal: true

require 'solution'

class Day13 < Solution
  def parse(input = nil)
    input ||= data_whole

    pairs = input.split("\n\n").map { |pair| pair.split("\n") }
    pairs.map do |first, second|
      [parse_packet(first), parse_packet(second)]
    end
  end

  def part1(input)
    orders = input.map do |left, right|
      in_order?(left, right)
    end

    orders.each_index.inject(0) do |sum, idx|
      sum += idx + 1 if orders[idx]
      sum
    end
  end

  def part2(input)
    flattened = input.each_with_object([]) do |pair, res|
      res.push(*pair)
    end
    flattened.push([[2]], [[6]])

    sorted = flattened.sort do |a, b|
      if in_order?(a, b)
        -1
      else
        1
      end
    end

    (sorted.index([[2]]) + 1) * (sorted.index([[6]]) + 1)
  end

  private

  def in_order?(left, right)
    index = -1
    loop do
      index += 1

      left_v = left[index]
      right_v = right[index]

      return true if left_v.nil?
      return false if right_v.nil?

      # both integers
      if left_v.is_a?(Integer) && right_v.is_a?(Integer)
        next if left_v == right_v

        return left_v < right_v
      end

      # wrap if one is an integer
      left_v = [left_v] unless left_v.is_a?(Array)
      right_v = [right_v] unless right_v.is_a?(Array)

      # both arrays
      return in_order?(left_v, right_v)
    end
  end

  def parse_packet(string)
    stack = []
    current_list = nil
    current_value = ''

    string.chars.each do |char|
      case char
      when '['
        stack.push(current_list)
        current_list = []
        current_value = ''
      when ']'
        if current_value.respond_to?(:to_i)
          current_list.push(current_value.to_i) unless current_value == ''
        else
          current_list.push(current_value)
        end
        current_value = current_list
        current_list = stack.pop
      when ','
        current_value = current_value.to_i if current_value.respond_to?(:to_i)
        current_list.push(current_value)
        current_value = ''
      else
        current_value += char
      end
    end
    current_value
  end
end
