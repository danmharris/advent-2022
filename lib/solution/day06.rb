# frozen_string_literal: true

require 'solution'

class Day06 < Solution
  def parse
    data.shift
  end

  def part1(input)
    start_of_message(input.chars, 4)
  end

  def part2(input)
    start_of_message(input.chars, 14)
  end

  private

  def make_windows(arr, size)
    x = (size - 1).times.map do |i|
      arr.drop(i + 1)
    end
    arr.zip(*x).filter { |window| window.all? { |c| !c.nil? } }
  end

  def start_of_message(input, size)
    windows = make_windows(input, size)

    index = windows.find_index do |window|
      window.uniq.size == window.size
    end
    index + size
  end
end
