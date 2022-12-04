# frozen_string_literal: true

require 'solution'

class Day04 < Solution
  def parse
    data.map do |line|
      line.split(/,/).map do |pair|
        pair.split(/-/).map(&:to_i)
      end
    end
  end

  def part1(input)
    input.select do |pair|
      contained?(pair[0], pair[1])
    end.size
  end

  def part2(input)
    input.select do |pair|
      overlap?(pair[0], pair[1])
    end.size
  end

  private

  def contained?(first, second)
    la = first[0]
    ua = first[1]

    lb = second[0]
    ub = second[1]

    (la.between?(lb, ub) && ua.between?(lb, ub)) || (lb.between?(la, ua) && ub.between?(la, ua))
  end

  def overlap?(first, second)
    la = first[0]
    ua = first[1]

    lb = second[0]
    ub = second[1]

    (la.between?(lb, ub) || ua.between?(lb, ub)) || (lb.between?(la, ua) || ub.between?(la, ua))
  end
end
