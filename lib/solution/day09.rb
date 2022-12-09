# frozen_string_literal: true

require 'set'
require 'solution'

class Day09 < Solution
  def parse
    data.map do |line|
      move = line.split
      move[1] = move[1].to_i
      move
    end
  end

  def part1(input)
    hx = 0
    hy = 0
    tx = 0
    ty = 0

    visited = Set.new

    input.each do |move|
      dir, val = move

      val.times do |_|
        currx = hx
        curry = hy
        hx, hy = move_head(dir, hx, hy)

        if (hx - tx).abs > 1 || (hy - ty).abs > 1
          tx = currx
          ty = curry
        end

        visited.add("#{tx}:#{ty}")
      end
    end
    visited.size
  end

  def part2(input)
    hx = 0
    hy = 0

    knots = Array.new(9).map { |_| [0, 0] }
    visited = Set.new

    input.each do |move|
      dir, val = move

      val.times do |_|
        hx, hy = move_head(dir, hx, hy)
        knots = move_knots(knots, hx, hy)

        visited.add("#{knots[8][0]}:#{knots[8][1]}")
      end
    end
    visited.size
  end

  private

  def move_head(dir, headx, heady)
    case dir
    when 'L'
      headx -= 1
    when 'R'
      headx += 1
    when 'D'
      heady -= 1
    when 'U'
      heady += 1
    end

    [headx, heady]
  end

  def move_knots(knots, headx, heady)
    knots.map do |knot|
      x, y = knot

      diffx = headx - x
      diffy = heady - y

      if diffx.abs > 1 || diffy.abs > 1
        x += diffx / diffx.abs unless diffx.zero?
        y += diffy / diffy.abs unless diffy.zero?
      end

      headx = x
      heady = y

      [x, y]
    end
  end
end
