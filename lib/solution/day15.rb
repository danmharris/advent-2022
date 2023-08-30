# frozen_string_literal: true

require 'set'
require 'solution'

class Day15 < Solution
  def parse(input = nil)
    input ||= data_whole

    line_regex = Regexp.new(/Sensor at x=([0-9-]+), y=([0-9-]+): closest beacon is at x=([0-9-]+), y=([0-9-]+)/)

    input.split("\n").map do |line|
      x, y, bx, by = line_regex.match(line).captures.map(&:to_i)
      Sensor.new(x, y, bx, by)
    end
  end

  def part1(input, row = 2000000)
    locs = Set.new

    input.each do |sensor|
      dy = (sensor.y - row).abs
      max_dx = sensor.dist - dy

      locs.merge((sensor.x - max_dx..sensor.x + max_dx))
      locs.delete(sensor.x) if sensor.y == row
      locs.delete(sensor.bx) if sensor.by == row
    end
    locs.size
  end

  def part2(input, max = 4000000)
    max.times do |row|
      blocks = input.each_with_object([]) do |sensor, b|
        dy = (sensor.y - row).abs
        max_dx = sensor.dist - dy
        next if max_dx.negative?

        b.push([sensor.x - max_dx, sensor.x + max_dx].minmax)
      end
      blocks = blocks.sort

      x = 0
      loop do
        curr = blocks.find do |start, fin|
          x.between?(start, fin)
        end

        return (x * 4000000) + row if curr.nil?

        x = curr[1] + 1
        break if x > max
      end
    end
  end

  class Sensor
    attr_reader :x, :y, :bx, :by, :dist

    def initialize(sensor_x, sensor_y, beacon_x, beacon_y)
      @x = sensor_x
      @y = sensor_y
      @bx = beacon_x
      @by = beacon_y

      @dist = (@x - @bx).abs + (@y - @by).abs
    end
  end
end
