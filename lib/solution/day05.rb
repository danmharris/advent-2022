# frozen_string_literal: true

require 'solution'

class Day05 < Solution
  def parse
    dat = data_whole.split(/\n\n/)

    {
      initial: parse_crates(dat[0]),
      moves: parse_moves(dat[1])
    }
  end

  def part1(input)
    crates = input[:initial]
    input[:moves].each do |move|
      count, from, to = move

      count.times do |_|
        crates[to].push(crates[from].pop)
      end
    end

    top_of_crates(crates)
  end

  def part2(input)
    crates = input[:initial]
    input[:moves].each do |move|
      count, from, to = move

      tmp = []
      count.times do |_|
        p = crates[from].pop
        tmp.unshift(p)
      end
      crates[to].concat(tmp)
    end
    top_of_crates(crates)
  end

  private

  def parse_crates(crates)
    initial = crates.split(/\n/).reverse
    indexes = initial.shift.chars
    crates = []

    initial.each do |line|
      line.chars.each_with_index do |v, i|
        next if v.nil?
        next unless v.match(/[A-Z]/)

        index = indexes[i].to_i
        crates[index] ||= []
        crates[index].push(v)
      end
    end
    crates
  end

  def parse_moves(moves)
    moves.split(/\n/).map do |move|
      move.match(/move (\d+) from (\d+) to (\d+)/).captures.map(&:to_i)
    end
  end

  def top_of_crates(crates)
    res = String.new
    crates.each do |crate|
      next if crate.nil?

      res << crate.pop
    end
    res
  end
end
