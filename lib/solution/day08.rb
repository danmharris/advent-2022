# frozen_string_literal: true

require 'set'
require 'solution'

class Day08 < Solution
  def parse(input = nil)
    input = data if input.nil?

    input.map do |line|
      line.chars.map(&:to_i)
    end.flatten
  end

  def part1(input)
    size = Math.sqrt(input.size).to_i

    visible = Set.new

    (1..size - 2).each do |row|
      # left right
      visible |= tree_visible(input) do |col|
        (row * size) + col
      end

      # up down
      visible |= tree_visible(input) do |col|
        (col * size) + row
      end
    end

    visible.size + 4
  end

  def part2(input)
    size = Math.sqrt(input.size).to_i

    max = 0
    size.times do |row|
      size.times do |col|
        sc = score(input, row, col)
        max = sc if sc > max
      end
    end
    max
  end

  def score(input, row, col)
    size = Math.sqrt(input.size).to_i
    index = (row * size) + col

    total = 1

    # left
    total *= dir_score(input, index, col) { |ix, i| ix - i }

    # right
    total *= dir_score(input, index, size - 1 - col) { |ix, i| ix + i }

    # up
    total *= dir_score(input, index, row) { |ix, i| ix - (size * i) }

    # down
    total *= dir_score(input, index, size - 1 - row) { |ix, i| ix + (size * i) }

    total
  end

  private

  def tree_visible_uni(input, iter, &block)
    visible = Set.new
    max = -1
    iter.each do |col|
      index = block.call(col)
      val = input[index]
      if val > max
        visible.add(index)
        max = val
      end
    end
    visible
  end

  def tree_visible(input, &block)
    size = Math.sqrt(input.size).to_i
    tree_visible_uni(input, size.times, &block) | tree_visible_uni(input, size.times.reverse_each, &block)
  end

  def dir_score(input, index, stop, &block)
    val = input[index]

    i = 1
    while i < stop
      newindex = block.call(index, i)
      break if input[newindex] >= val

      i += 1
    end
    i
  end
end
