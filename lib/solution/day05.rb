# frozen_string_literal: true

require 'solution'

class Day05 < Solution
  def parse
    res = {
      initial: [],
      moves: []
    }

    data_path = File.join(Dir.pwd, 'data', self.class.name.downcase)
    dat = File.read(data_path).split(/\n\n/)
    initial = dat[0].split(/\n/).reverse

    indexes = initial.shift.chars

    initial.each do |line|
      line.chars.each_with_index do |v, i|
        next if v.nil?
        next unless v.match(/[A-Z]/)

        index = indexes[i].to_i
        res[:initial][index] ||= []
        res[:initial][index].push(v)
      end
    end

    moves = dat[1]
    res[:moves] = moves.split(/\n/).map do |move|
      move.match(/move (\d+) from (\d+) to (\d+)/).captures.map(&:to_i)
    end
    res
  end

  def part1(input)
    crates = input[:initial]
    input[:moves].each do |move|
      count, from, to = move

      count.times do |_|
        crates[to].push(crates[from].pop)
      end
    end

    res = String.new
    crates.each do |crate|
      next if crate.nil?

      res << crate.pop
    end
    res
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

    res = String.new
    crates.each do |crate|
      next if crate.nil?

      res << crate.pop
    end
    res
  end
end
