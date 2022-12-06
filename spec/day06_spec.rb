# frozen_string_literal: true

require 'solution/day06'

RSpec.describe Day06 do
  examples = [
    # input, part 1, part 2
    ['mjqjpqmgbljsphdztnvjfqwrcgsmlb', 7, 19],
    ['bvwbjplbgvbhsrlpgdmjqwftvncz', 5, 23],
    ['nppdvjthqldpwncqszvftbrmjlhg', 6, 23],
    ['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 10, 29],
    ['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 11, 26]
  ]

  describe 'part1' do
    examples.each_with_index do |example, i|
      it "runs against example #{i}" do
        sol = described_class.new
        expect(sol.part1(example[0])).to eq(example[1])
      end
    end
  end

  describe 'part2' do
    examples.each_with_index do |example, i|
      it "runs against example #{i}" do
        sol = described_class.new
        expect(sol.part2(example[0])).to eq(example[2])
      end
    end
  end
end
