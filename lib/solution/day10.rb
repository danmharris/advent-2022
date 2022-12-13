# frozen_string_literal: true

require 'solution'

class Day10 < Solution
  def parse
    data.map do |line|
      l = line.split
      l[1] = l[1].to_i if l.size == 2
      l
    end
  end

  def part1(input)
    strengths = calculate_strengths(input)

    [20, 60, 100, 140, 180, 220].map do |cycle|
      cycle * strengths[cycle - 1]
    end.sum
  end

  def part2(input)
    strengths = calculate_strengths(input)

    6.times do |i|
      row = strengths[i * 40, 40]
      chars = String.new
      row.each.with_index do |signal, idx|
        chars << ((signal - 1..signal + 1).include?(idx) ? '#' : '.')
      end
      puts chars
    end
  end

  private

  def calculate_strengths(input)
    input.each_with_object([1]) do |line, reg|
      op, val = line
      curr = reg[-1]
      case op
      when 'noop'
        reg.push(curr)
      when 'addx'
        reg.push(curr, curr + val)
      end
    end
  end
end
