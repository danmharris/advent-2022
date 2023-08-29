# frozen_string_literal: true

require 'solution'

class Day11 < Solution
  def parse(input = nil)
    input ||= data_whole
    monkeys = input.split("\n").map(&:strip).slice_when { |line, _| line == '' }

    monkeys.map do |m|
      m.shift # don't care about line

      _, _, item_line = m.shift.partition(': ')
      items = item_line.split(', ').map(&:to_i)

      _, _, operation_line = m.shift.partition('= ')
      operation_line = operation_line.match(/(\w+) (\*|\+) (\w+)/)
      lhs, operand, rhs = operation_line.captures

      lhs = lhs == 'old' ? :old : lhs.to_i
      rhs = rhs == 'old' ? :old : rhs.to_i
      operand = operand.to_sym
      operation = Operation.new(lhs, operand, rhs)

      _, _, divisor_line = m.shift.partition('by ')
      divisor = divisor_line.to_i

      _, _, true_line = m.shift.partition('monkey ')
      true_dest = true_line.to_i

      _, _, false_line = m.shift.partition('monkey ')
      false_dest = false_line.to_i

      Monkey.new(items, operation, divisor, true_dest, false_dest)
    end
  end

  def part1(input)
    20.times do
      input.each do |monkey|
        monkey.round.each do |item, dest|
          input[dest].add_item(item)
        end
      end
    end

    most_active = input.map(&:inspect_count).sort.reverse.take(2)
    most_active[0] * most_active[1]
  end

  def part2(input)
    lcm = input.map(&:divisor).reduce(:*)
    10000.times do
      input.each do |monkey|
        monkey.round(1).each do |item, dest|
          input[dest].add_item(item % lcm)
        end
      end
    end

    most_active = input.map(&:inspect_count).sort.reverse.take(2)
    most_active[0] * most_active[1]
  end
end

class Monkey
  attr_reader :items, :inspect_count, :divisor

  def initialize(items, operation, divisor, true_dest, false_dest)
    @items = items
    @operation = operation
    @divisor = divisor
    @true_dest = true_dest
    @false_dest = false_dest
    @inspect_count = 0
  end

  def add_item(item)
    @items.push(item)
  end

  def round(divisor = 3)
    dests = []

    @items.each do |item|
      new_value = (@operation.perform(item) / divisor).floor
      if (new_value % @divisor).zero?
        dests.push([new_value, @true_dest])
      else
        dests.push([new_value, @false_dest])
      end
    end

    @inspect_count += @items.size
    @items = []
    dests
  end
end

class Operation
  def initialize(lhs, operand, rhs)
    @lhs = lhs
    @operand = operand
    @rhs = rhs
  end

  def perform(value)
    lhs = @lhs == :old ? value : @lhs
    rhs = @rhs == :old ? value : @rhs

    return lhs * rhs if @operand == :*
    return lhs + rhs if @operand == :+
  end
end
