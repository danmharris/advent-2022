# frozen_string_literal: true

require 'solution'

class Day14 < Solution
  def parse(input = nil)
    input ||= data_whole
    grid = Grid.new

    input = input.split("\n").map { |line| line.split(' -> ') }

    input.each do |line|
      loop do
        start = line.shift.split(',').map(&:to_i)
        break if line.empty?

        fin = line[0].split(',').map(&:to_i)

        start = Point.new(*start)
        fin = Point.new(*fin)

        grid.fill_line(start, fin)
      end
    end
    grid
  end

  def part1(input)
    fall = Point.new(500, 0)
    count = 0
    loop do
      fallen = input.fall(fall)
      break unless fallen

      count += 1
    end

    count
  end

  def part2(input)
    max_y = input.max_y + 2
    input.fill_line(Point.new(-100000, max_y), Point.new(1000000, max_y))

    fall = Point.new(500, 0)
    count = 0
    loop do
      input.fall(fall)
      count += 1

      break if input.grid.include?(fall)
    end
    count
  end

  class Grid
    attr_reader :grid, :max_y

    def initialize
      @grid = {}
      @max_y = 0
    end

    def add_point(point)
      @max_y = point.y if point.y > @max_y
      @grid[point] = true
    end

    def fill_line(start, fin)
      if start.x == fin.x
        min, max = [start.y, fin.y].minmax
        (min..max).each do |y|
          add_point(Point.new(start.x, y))
        end
      else
        min, max = [start.x, fin.x].minmax
        (min..max).each do |x|
          add_point(Point.new(x, start.y))
        end
      end
    end

    def fall(point)
      loop do
        down = Point.new(point.x, point.y + 1)
        down_left = Point.new(point.x - 1, point.y + 1)
        down_right = Point.new(point.x + 1, point.y + 1)

        return false if down.y > @max_y

        unless @grid.include?(down)
          point = down
          next
        end

        unless @grid.include?(down_left)
          point = down_left
          next
        end

        unless @grid.include?(down_right)
          point = down_right
          next
        end

        add_point(point)
        return point
      end
    end
  end

  Point = Struct.new(:x, :y)
end
