# frozen_string_literal: true

require 'solution'

class Day01 < Solution
  def parse
    elves = data.slice_when { |val, _| val == '' }
    elves.map { |elf| elf.map(&:to_i) }
  end

  def part1(input)
    totals = input.map(&:sum)
    totals.max
  end

  def part2(input)
    totals = input.map(&:sum)
    totals.sort.reverse.take(3).sum
  end
end
