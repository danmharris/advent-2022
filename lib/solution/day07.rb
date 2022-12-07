# frozen_string_literal: true

require 'solution'

class Day07 < Solution
  def parse(input = nil)
    if input.nil?
      data_path = File.join(Dir.pwd, 'data', self.class.name.downcase)
      input = File.read(data_path)
    end

    root = Node.new('/', [])
    cmds = input.split(/\n?\$ /).drop(2)

    state = State.new(root, [])
    cmds.each { |cmd| state.run_cmd(cmd) }

    root
  end

  def part1(input)
    input.dir_size

    total = 0
    stack = [input]
    loop do
      curr = stack.pop
      break if curr.nil?
      next if curr.children.empty?

      total += curr.sz if curr.sz <= 100000
      stack.push(*curr.children)
    end
    total
  end

  def part2(input)
    input.dir_size

    res = input.sz
    stack = [input]
    loop do
      curr = stack.pop
      break if curr.nil?
      next if curr.children.empty?

      res = curr.sz if input.sz - curr.sz <= 40000000 && curr.sz < res
      stack.push(*curr.children)
    end
    res
  end
end

Node = Struct.new('Node', :name, :children, :sz) do
  def append(name, size = nil)
    curr = children.find { |c| c.name == name }
    if curr.nil?
      curr = Node.new(name, [], size)
      children.push(curr)
    end
    curr
  end

  def dir_size
    return sz unless sz.nil?

    self.sz = children.map(&:dir_size).sum
  end
end

State = Struct.new('State', :curr, :stack) do
  def run_cmd(cmd)
    case cmd
    when /^cd/
      cd(cmd)
    when /^ls/
      ls(cmd)
    end
  end

  private

  def cd(cmd)
    dirname = cmd.match(/^cd (.*)$/).captures.shift

    if dirname == '..'
      self.curr = stack.pop
    else
      dir = curr.append(dirname)
      stack.push(curr)
      self.curr = dir
    end
  end

  def ls(cmd)
    cmd.split(/\n/).drop(1).each do |line|
      size, name = line.split
      if size == 'dir'
        curr.append(name)
      else
        curr.append(name, size.to_i)
      end
    end
  end
end
