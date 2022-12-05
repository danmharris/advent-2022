# frozen_string_literal: true

class Solution
  def self.run
    sol = new

    puts "Part 1: #{sol.part1(sol.parse)}"
    puts "Part 2: #{sol.part2(sol.parse)}"
  end

  private

  def data
    data_path = File.join(Dir.pwd, 'data', self.class.name.downcase)
    File.readlines(data_path, chomp: true)
  end
end
