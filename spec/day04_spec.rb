# frozen_string_literal: true

require 'solution/day04'

RSpec.describe Day04 do
  input = [
    [[2, 4], [6, 8]],
    [[2, 3], [4, 5]],
    [[5, 7], [7, 9]],
    [[2, 8], [3, 7]],
    [[6, 6], [4, 6]],
    [[2, 6], [4, 8]]
  ]
  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq(2)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(4)
    end
  end
end
