# frozen_string_literal: true

require 'solution'

class Day03 < Solution
  def parse
    data
  end

  def part1(input)
    input.map(&:chars)
         .map { |line| split_half(line) }
         .map { |line| line[0].intersection(line[1]) }
         .flatten
         .map { |common| priority(common) }
         .sum
  end

  def part2(input)
    groups = []
    input.map(&:chars).each_slice(3) do |group|
      groups.push(group[0].intersection(group[1], group[2]))
    end

    groups.flatten
          .map { |badge| priority(badge) }
          .sum
  end

  private

  def priority(char)
    if char.match(/[a-z]/)
      char.ord - 96
    else
      char.ord - 38
    end
  end

  def split_half(line)
    size = line.length / 2
    [line.take(size), line.drop(size)]
  end
end
