# frozen_string_literal: true

class Solution
  def self.run
    sol = new
    input = sol.parse

    puts "Part 1: #{sol.part1(input)}"
    puts "Part 2: #{sol.part2(input)}"
  end

  private

  def data
    data_path = File.join(Dir.pwd, 'data', self.class.name.downcase)
    File.readlines(data_path, chomp: true)
  end
end
