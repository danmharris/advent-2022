# frozen_string_literal: true

require 'set'
require 'solution'

class Day12 < Solution
  def parse
    d = data.map(&:chars)
    width = d[0].size
    height = d.size
    Grid.new(d.flatten, width, height)
  end

  def part1(input)
    dijkstra(input, input.end, 'S')
  end

  def part2(input)
    dijkstra(input, input.end, 'a')
  end

  private

  def dijkstra(grid, start, finish)
    unvisited = grid.all_pos.to_set
    distances = init_distances(grid, start)
    current = start

    loop do
      4.times do |i|
        new = grid.move(current, i)
        next if new.nil?
        next unless grid.elevation(current).ord - grid.elevation(new).ord <= 1
        next unless unvisited.include?(new)

        dist = distances[current] + 1
        distances[new] = dist if dist < distances[new]
      end

      unvisited.delete(current)
      break if grid.val(current) == finish

      current = min_distance(distances, unvisited)
    end

    distances[current]
  end

  def init_distances(grid, start)
    grid.all_pos.each_with_object({}) do |pos, obj|
      obj[pos] = pos == start ? 0 : 9999999999999
      obj
    end
  end

  def min_distance(distances, unvisited)
    distances.sort_by { |_, v| v }.filter { |k, _| unvisited.include?(k) }[0][0]
  end
end

Grid = Struct.new('Grid', :content, :width, :height) do
  def end
    index = content.find_index('E')
    y = index / width
    x = index % width
    Pos.new(x, y)
  end

  def elevation(pos)
    index = (pos.y * width) + pos.x
    res = content[index]

    return 'z' if res == 'E'
    return 'a' if res == 'S'

    res
  end

  def val(pos)
    index = (pos.y * width) + pos.x
    content[index]
  end

  def all_pos
    content.map.with_index do |_, index|
      y = index / width
      x = index % width
      Pos.new(x, y)
    end
  end

  def move(pos, direction)
    pos = case direction
          when 0
            Pos.new(pos.x, pos.y - 1)
          when 1
            Pos.new(pos.x + 1, pos.y)
          when 2
            Pos.new(pos.x, pos.y + 1)
          when 3
            Pos.new(pos.x - 1, pos.y)
          end
    pos unless pos_invalid?(pos)
  end

  def pos_invalid?(pos)
    pos.y.negative? || pos.x.negative? || pos.y >= height || pos.x >= width
  end
end

Pos = Struct.new('Pos', :x, :y)
