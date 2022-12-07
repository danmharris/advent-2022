# frozen_string_literal: true

class Solution
  def self.run
    sol = new

    puts "Part 1: #{sol.part1(sol.parse)}"
    puts "Part 2: #{sol.part2(sol.parse)}"
  end

  private

  def data
    File.readlines(data_path, chomp: true)
  end

  def data_whole
    File.read(data_path)
  end

  def data_path
    File.join(Dir.pwd, 'data', self.class.name.downcase)
  end
end
